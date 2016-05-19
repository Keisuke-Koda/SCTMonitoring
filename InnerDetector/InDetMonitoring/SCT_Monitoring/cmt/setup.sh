# echo "setup SCT_Monitoring SCT_Monitoring-r735330 in /afs/cern.ch/user/k/kkoda/private/SCTMonitoring/InnerDetector/InDetMonitoring"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc49-opt/20.7.5/CMT/v1r25p20140131; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtSCT_Monitoringtempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if test ! $? = 0 ; then cmtSCT_Monitoringtempfile=/tmp/cmt.$$; fi
${CMTROOT}/${CMTBIN}/cmt.exe setup -sh -pack=SCT_Monitoring -version=SCT_Monitoring-r735330 -path=/afs/cern.ch/user/k/kkoda/private/SCTMonitoring/InnerDetector/InDetMonitoring  -no_cleanup $* >${cmtSCT_Monitoringtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/${CMTBIN}/cmt.exe setup -sh -pack=SCT_Monitoring -version=SCT_Monitoring-r735330 -path=/afs/cern.ch/user/k/kkoda/private/SCTMonitoring/InnerDetector/InDetMonitoring  -no_cleanup $* >${cmtSCT_Monitoringtempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtSCT_Monitoringtempfile}
  unset cmtSCT_Monitoringtempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtSCT_Monitoringtempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtSCT_Monitoringtempfile}
unset cmtSCT_Monitoringtempfile
return $cmtsetupstatus

