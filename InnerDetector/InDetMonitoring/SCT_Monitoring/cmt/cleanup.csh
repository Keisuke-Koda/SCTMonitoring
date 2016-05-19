# echo "cleanup SCT_Monitoring SCT_Monitoring-r735330 in /afs/cern.ch/user/k/kkoda/private/SCTMonitoring/InnerDetector/InDetMonitoring"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc49-opt/20.7.5/CMT/v1r25p20140131
endif
source ${CMTROOT}/mgr/setup.csh
set cmtSCT_Monitoringtempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if $status != 0 then
  set cmtSCT_Monitoringtempfile=/tmp/cmt.$$
endif
${CMTROOT}/${CMTBIN}/cmt.exe cleanup -csh -pack=SCT_Monitoring -version=SCT_Monitoring-r735330 -path=/afs/cern.ch/user/k/kkoda/private/SCTMonitoring/InnerDetector/InDetMonitoring  $* >${cmtSCT_Monitoringtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/${CMTBIN}/cmt.exe cleanup -csh -pack=SCT_Monitoring -version=SCT_Monitoring-r735330 -path=/afs/cern.ch/user/k/kkoda/private/SCTMonitoring/InnerDetector/InDetMonitoring  $* >${cmtSCT_Monitoringtempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtSCT_Monitoringtempfile}
  unset cmtSCT_Monitoringtempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtSCT_Monitoringtempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtSCT_Monitoringtempfile}
unset cmtSCT_Monitoringtempfile
exit $cmtcleanupstatus

