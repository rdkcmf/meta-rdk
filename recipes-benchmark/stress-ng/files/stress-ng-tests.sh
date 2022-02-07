#!/bin/sh


## Start Global variables

RW_DISK_LOCATION="/opt"
LOG_PATH="/opt/logs"
STRESS_NG_LOG_PATH="$LOG_PATH/stress-ng_logs"
LOG_FILE="$STRESS_NG_LOG_PATH/rdk-oss-perf-stats.log"
STRESS_NG_WORKSPACE="$RW_DISK_LOCATION/stress-ng"
ENABLE_PERF="--perf"

TEMP_PATH="--temp-path $STRESS_NG_WORKSPACE"

TEST_COUNT=0

YAML_OPTION="--yaml $STRESS_NG_LOG_PATH/metrics_"

#Logging Arguments
upload_protocol="HTTP"
upload_httplink="https://ssr.ccp.xcal.tv/cgi-bin/S3.cgi"
tftp_server="logs.xcal.tv"

## End Global variables


log(){
   echo "`date` :`basename $0`: $*"    >> $LOG_FILE
}

tearDown() {
    echo "Tear down test resources"
    rm -rf $STRESS_NG_WORKSPACE
    log "End of stress NG tests"
}

logUptime(){
    echo "UPTIME : `uptime`" >> $LOG_FILE
    echo "" >> $LOG_FILE
}

logMem() {
    echo "Memory Details:" >>$LOG_FILE
    echo "`free`" >> $LOG_FILE
    echo "" >> $LOG_FILE
}

execAndRedirectOut(){

    TEST_COUNT=$((TEST_COUNT + 1))
    command=$*
    echo "Executing Stressor:$test"
    log " ===== Start : $command  ====="
    logUptime
    logMem
    currentDir=`pwd`
    cd $STRESS_NG_WORKSPACE
    $command >> $LOG_FILE  2>&1
    cd $currentDir
    logUptime
    logMem
    log " ===== End: $command  ====="
    echo "" >> $LOG_FILE
}


cpuStressTest(){
    #Load Avg:69
    test="cpu"
    execAndRedirectOut stress-ng --all 4 --class cpu --exclude atomic,zlib,wcs,tree,radixsort,ioport,heapsort,crypt,pkey,numa,mergesort,judy -t 1m --times --metrics $ENABLE_PERF $YAML_OPTION$test$TEST_COUNT.yaml
}

cpuLongRunTest(){

   # Run cpu stressors on all online CPUs working through all the available CPU stressors for 5m
    test="cpu"
    execAndRedirectOut stress-ng $TEMP_PATH --cpu 0 --cpu-method all -t 5m --times --metrics $YAML_OPTION$test$TEST_COUNT.yaml
}

diskIOTests(){
    test="io"
    # start N workers continually writing with commit buffer cache to disk, reading and removing temporary
    execAndRedirectOut stress-ng $TEMP_PATH --io 2 --timeout 10s --metrics --times $ENABLE_PERF $YAML_OPTION$test$TEST_COUNT.yaml
    #load avg of 30
    execAndRedirectOut stress-ng --class io --all 4 --exclude aiol,io-uring,rawdev,readahead -t 1m --times --metrics $ENABLE_PERF $YAML_OPTION$test$TEST_COUNT.yaml
    #stress-ng --iomix 1 -t 20 -v
}

schedulerTests() {
    test="scheduler"
    #load average: 193.86 120.35 53.12.incase of seq execution around 12
    execAndRedirectOut stress-ng --sequential 4 --class scheduler -t 1m --exclude netlink-task --times --metrics $YAML_OPTION$test$TEST_COUNT.yaml
}
memStressTest(){
    test="memory"
    # Use mmap N bytes per vm worker. specify size as % of total available memory
    # TBD : Beware of OOM killer triggering reboot - use percentile of available memory for stress test
    # Example of test triggering reboot stress-ng --brk 0 --stack 0 --bigheap 0
    #executing memory class makes the system to reboot
    execAndRedirectOut stress-ng $TEMP_PATH --vm 1 --vm-bytes 20% -t 10s --times $YAML_OPTION$test$TEST_COUNT.yaml
    execAndRedirectOut stress-ng --hdd 1 --hdd-bytes 50% -t 5s --metrics $YAML_OPTION$test$TEST_COUNT.yaml
    execAndRedirectOut stress-ng --malloc 1 --malloc-bytes 20% -t 10s --metrics -v --perf $YAML_OPTION$test$TEST_COUNT.yaml
    execAndRedirectOut stress-ng --stack 1 -t 10s --metrics $YAML_OPTION$test$TEST_COUNT.yaml
    execAndRedirectOut stress-ng --str 1 -t 10s --metrics $YAML_OPTION$test$TEST_COUNT.yaml
    execAndRedirectOut stress-ng --memcpy 1 -t 10s --metrics $YAML_OPTION$test$TEST_COUNT.yaml
    execAndRedirectOut stress-ng --memfd 1 -t 10s --metrics $YAML_OPTION$test$TEST_COUNT.yaml
    execAndRedirectOut stress-ng --stream 1 -t 10s --metrics $YAML_OPTION$test$TEST_COUNT.yaml
#execAndRedirectOut stress-ng --sequential 1 --class memory --exclude atomic,membarrier,judy,heapsort,mergesort,numa,pipe,pipeherd,radixsort,tree,wcs,zlib -t 10s --times --metrics $YAML_OPTION$test$TEST_COUNT.yaml

    # Shared memory tests has some problems
    # execAndRedirectOut stress-ng --shm --shm-bytes 100% -v -t 5s
}

thermalZoneTests() {

   ##TBD - Debug this stress-ng: info:  [12561] thermal zone temperatures not available
    execAndRedirectOut stress-ng --matrix 0 --tz -t 60 --log-brief -v --times $YAML_OPTION$test$TEST_COUNT.yaml
    execAndRedirectOut stress-ng --cpu 0 --tz -t 5 --log-brief $YAML_OPTIOt$test$TEST_COUNT.yaml
}

pageFaultTests(){
    test="os"
        #load average:  46.79 18.09 14.62
    execAndRedirectOut stress-ng --fault 4 --switch 4 --loop 4 --klog 4  --ptrace 4 --pty 4  --sendfile 4 --seccomp 4 --resources 4 --revio 4 --rmap 4  --perf -t 1m --times --metrics $YAML_OPTION$test$TEST_COUNT.yaml
}

timerTests(){
    test="timer"
    #load average: 13.72 16.99 27.67
    execAndRedirectOut stress-ng --timer 4 --timer-freq 1000000 --rtc 4 --clock 4 --itimer 4 --timerfd 4 --metrics -t 1m --times $YAML_OPTION$test$TEST_COUNT.yaml
}

networkTests(){
    test="network"
    #sock testcase has some issue
    execAndRedirectOut stress-ng --sequential 1 --class network --exclude dccp,sctp,sock -t 10s --metrics --times $YAML_OPTION$test$TEST_COUNT.yaml
}

runAllTests(){
   # run 4 simultaneous instances of all the stressors sequentially one by one, each for 6 minutes and summaries with performance metrics at the end
   # --pathological  Go for it !!! Destructive tests 
    stress-ng $TEMP_PATH --sequential 4 --timeout 6m --pathological --metrics $YAML_OPTION$TEST_COUNT.yaml
}

# This test can be used to check for applications that doesn't handle OOM gracefully
memoryPressureTest() {
    test="memory"
   #load average: 31.05 26.55 18.00
   execAndRedirectOut stress-ng --brk 30 --brk-notouch --verbose --metrics -t 30s –-times $YAML_OPTION$test$TEST_COUNT.yaml
   #load average: 
   execAndRedirectOut stress-ng --shm 10 --shm-objs 4 --shm-bytes 5% --times --metrics -t 30s $YAML_OPTION$test$TEST_COUNT.yaml
   #load average: 5.26 5.97 3.34
   execAndRedirectOut stress-ng --bigheap 1 --bigheap-growth 4K -t 4s --times $YAML_OPTION$test$TEST_COUNT.yaml
   #stress-ng --brk 2 --stack 2 --bigheap 2
   
}

pipeTests() {
   test="pipe"
   #load avg of 139
   execAndRedirectOut stress-ng --class pipe --all 4 --times -t 30s --metrics $YAML_OPTION$test$TEST_COUNT.yaml
}

fileTests() {
   test="file"
   #load avg of 150
   execAndRedirectOut stress-ng --sequential 1 --class filesystem --exclude binderfs,chattr,fiemap,xattr,iomix -t 30s --times --metrics  $YAML_OPTION$test$TEST_COUNT.yaml
}
ipcTests() {
    test="ipc"
    #ipcTests already covered in Scheculer Testcase
    execAndRedirectOut stress-ng --mq 4 --shm 4 --sem 4 -t 20s --times --metrics $YAML_OPTION$test$TEST_COUNT.yaml
}
signalTests() {
    test="signal"
#load average: 70.21, 21.60, 14.11
#sigabrt causing coredump
    execAndRedirectOut stress-ng --sigfd 4 --sigfpe 4 --sigchld 4 --sigio 4 --sigpending 4 --sigsegv 4 --sigsuspend 4 --sigq 4  --sigtrap 4 -t 20s --times --metrics $YAML_OPTION$test$TEST_COUNT.yaml
}
systemcallTests() {
    test="syscall"
    #exercise process creation/Termination
        # load average: 23.45 14.50 12.89
        # wait reboots the system in some cases 
    execAndRedirectOut stress-ng --fork 8 --open 8 --close 8 --seek 8  --kill 8 -t 20s --metrics --times  $YAML_OPTION$test$TEST_COUNT.yaml
}

getStressExeSize() {
    log "SIZE OF THE STRESS-NG EXE:"
    echo "`size /usr/bin/stress-ng`" >> $LOG_FILE
}

init(){
   rm -rf $LOG_PATH/* 
   mkdir -p /opt/stress-ng
   mkdir -p $LOG_PATH/stress-ng_logs
   echo '' > $LOG_FILE
   rm -f $STRESS_NG_LOG_PATH/metrics_*
   getStressExeSize
   log "Start of stress NG tests"
   
   memStressTest
   #memoryPressureTest  bigheap causing reboot
   sleep 60

   cpuLongRunTest
   cpuStressTest
   sleep 60

   #test="thermal"
   #thermalZoneTests

   pageFaultTests
   sleep 60

   networkTests
   sleep 60

   timerTests
   sleep 60

   ipcTests
   sleep 60

   signalTests
   sleep 60

   systemcallTests
   sleep 60

   fileTests
   sleep 60

   pipeTests
   sleep 60

   #schedulerTests
   #sleep 60

   diskIOTests
   sleep 60
}



# main starts here

init

# Test categories should be as below :
#CPU compute
#drive stress
#I/O syncs
#Pipe I/O
#cache thrashing
#VM stress
#socket stressing
#process creation and termination
#context switching properties

#cpuStressTest

#diskIOTest

#memStressTest

#cpuLongRunTest

#thermalZoneTests

#pageFaultTests

#networkTests


# Do not run all test atleast on XI6 - kernel crashes and OOM reboot kicks in  
# runAllTests

tearDown

/bin/sh /lib/rdk/rdk_oss_uploadSTBLogs.sh $tftp_server $upload_protocol $upload_httplink





