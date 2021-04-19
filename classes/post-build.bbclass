do_postbuild_shell () {
 DATE_STAMP=$(date -u +%Y%m%d%H%M%S)
 HOUR_STAMP=$(date -u "+%Y-%m-%d_%H")
 HOSTNAME=$(hostname)
 
 cd ${TOPDIR}
 
 CONSOLE_LATEST_LOG=$(find tmp/log/cooker/${MACHINE} -printf '%T+ %p\n' | sort -r | cut -d ' ' -f 2 | head -n 1)
 BUILD_STATS_LATEST=$(find tmp/buildstats -printf '%T+ %p\n' | sort -r | cut -d ' ' -f 2 | head -n 1)
 BRANCH_NAME=$(grep -r "PROJECT_BRANCH" conf/auto.conf | cut -d "=" -f 2 | tr -d '"' | tr -d " ")
 
 S3_FILE_NAME="dvm_log_${MACHINE}_${BRANCH_NAME}_${DATE_STAMP}.txt"
 cp ${CONSOLE_LATEST_LOG} ./console_tmp
 
 RESULT="Success"
 if grep -q "ERROR: " console_tmp ; then
   RESULT="Failure"
 fi
 
 START_TIME=$(grep "Build Started" ${BUILD_STATS_LATEST} | cut -d ":" -f 2 | tr -d " ")
 DURATION=$(grep "Elapsed time" ${BUILD_STATS_LATEST} | cut -d ":" -f 2)
 IMAGES=""
 
 for img in $(find tmp/deploy/images/${MACHINE} -name "${MACHINE_IMAGE_NAME}*bin" -newermt "`date -d @$START_TIME`"); do 
  IMAGES="${IMAGES} `basename $img .bin`" 
 done 

 SPACE_USED=$(du -hs .. | cut -f1)
  
 S3_File_In_Bkt="dev_vm_build_analytics/${HOUR_STAMP}/${S3_FILE_NAME}"
 
 echo "****Build Details****" >> ${S3_FILE_NAME}
 echo "DEV_VM_BUILD_ANALYTICS_S3_File_Name: ${S3_File_In_Bkt}" >> ${S3_FILE_NAME}
 echo "DEV_VM_BUILD_ANALYTICS_ID: ${HOSTNAME}" >> ${S3_FILE_NAME}
 echo "DEV_VM_BUILD_ANALYTICS_User: ${USER}" >> ${S3_FILE_NAME}
 echo "DEV_VM_BUILD_ANALYTICS_Device_Name: ${MACHINE}" >> ${S3_FILE_NAME}
 echo "DEV_VM_BUILD_ANALYTICS_Status: ${RESULT}" >> ${S3_FILE_NAME}
 echo "DEV_VM_BUILD_ANALYTICS_Branch:${BRANCH_NAME}" >> ${S3_FILE_NAME}
 echo "DEV_VM_BUILD_ANALYTICS_Start_Time: ${START_TIME}" >> ${S3_FILE_NAME}
 echo "DEV_VM_BUILD_ANALYTICS_Duration:${DURATION}" >> ${S3_FILE_NAME}
 echo "DEV_VM_BUILD_ANALYTICS_Images:${IMAGES}" >> ${S3_FILE_NAME}
 echo "DEV_VM_BUILD_ANALYTICS_Space_Used: ${SPACE_USED}" >> ${S3_FILE_NAME}
 echo "*********************" >> ${S3_FILE_NAME}
 echo >> ${S3_FILE_NAME}
 grep "cmd" buildhistory/.git/COMMIT_EDITMSG >> ${S3_FILE_NAME}
 echo >> ${S3_FILE_NAME}
 cat console_tmp >> ${S3_FILE_NAME}
 
 curl -s -k -T ${S3_FILE_NAME} https://dvms3upload.stb.r53.xcal.tv/unenc/ccp-stb-dvm-data/${S3_File_In_Bkt} > /dev/null 2>&1 

 rm -f console_tmp
 echo "POST-BUILD: Done"
}

addhandler postbuild_eventhandler
python postbuild_eventhandler() {
 from bb.event import getName
 if ( getName(e) == "CookerExit" ):
  print ("POST-BUILD: Copying stats to S3, this may take few minutes. Please wait...")
  bb.build.exec_func("do_postbuild_shell", e.data)
}

