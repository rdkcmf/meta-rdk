

RW_DISK_LOCATION="/opt"
LOG_PATH="/opt/logs"
STRESS_NG_LOG_PATH="$LOG_PATH/stress-ng_logs"
LOG_FILE="$STRESS_NG_LOG_PATH/rdk-oss-perf-stats.log"
STRESS_NG_WORKSPACE="$RW_DISK_LOCATION/stress-ng"_


setLogFile(){
   LOG_FILE="$STRESS_NG_LOG_PATH/$1_proc_stats.log"
   rm -f $LOG_FILE
}

log(){
    echo $* >> $LOG_FILE
}

getEthMac(){
    ifconfig eth0 | grep "HWaddr" | tr -s " " | rev | cut -d ' ' -f2
}

getCpuModel(){
    grep "model name" /proc/cpuinfo | head -n1 | tr -s ' ' | cut -d ' ' -f3
}

populateSystemInfo()
{
      log "---"
      log "system-info:"
      log "imagename: " TX061AEI_stable2_20220427091414OSS
      log "ethernet_MAC: `getEthMac`"
      log "date-yyyy-mm-dd: `date +'%Y:%m:%d'`"
      log "time-hh-mm-ss: `date +'%H:%M:%S'`"
      log "epoch-secs: `date +%s`"
      log "hostname: `hostname`"
      log "release: `uname -r`"
      log "machine: `getCpuModel`"
      log "uptime: `uptime`"
      log "gcc-version : `sed -e "s/.*gcc version //g" /proc/version | cut -d " " -f1`"
      log ""
      log "metrics:"
}

populateSysMemInfo(){

    log "- class: mem"
    log "`grep 'MemTotal:' /proc/meminfo`"
    log "`grep 'MemFree:' /proc/meminfo`"
    log "`grep 'MemAvailable:' /proc/meminfo`"
    log "`grep 'Shmem:' /proc/meminfo`"
    log "`grep 'Buffers:' /proc/meminfo`"
    log "`grep 'Dirty:' /proc/meminfo`"
    grep -i 'cached' /proc/meminfo >> $LOG_FILE
    grep -i 'active' /proc/meminfo >> $LOG_FILE
    grep -i 'commit' /proc/meminfo >> $LOG_FILE
    log ""

}

populateSysCPUInfo(){

    log "- class: cpu"
    log "Context_sitches : `grep 'ctxt' /proc/stat | tr -s " " | cut -d " " -f2`"
    grep "cpu" /proc/stat | tr -s " " | cut -d " " -f1,2 | sed -e "s/cpu/User_Time_cpu/g" | sed -e "s/ / : /g" >> $LOG_FILE
    grep "cpu" /proc/stat | tr -s " " | cut -d " " -f1,4 | sed -e "s/cpu/System_Time_cpu/g" | sed -e "s/ / : /g" >> $LOG_FILE
    grep "cpu" /proc/stat | tr -s " " | cut -d " " -f1,5 | sed -e "s/cpu/Idle_cpu/g" | sed -e "s/ / : /g" >> $LOG_FILE
    grep "cpu" /proc/stat | tr -s " " | cut -d " " -f1,8 | sed -e "s/cpu/Irq_cpu/g" | sed -e "s/ / : /g" >> $LOG_FILE
     
}


# Start 
fileNameSuffix=$1
if [ -z "${fileNameSuffix}" ]; then 
    echo "Please enter a file name sufix "
    echo "${0} start"
    exit 0
fi

setLogFile $fileNameSuffix

populateSystemInfo

populateSysMemInfo

populateSysCPUInfo

log "..."
