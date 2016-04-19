#-- start of make_header -----------------

#====================================
#  Library SCT_Monitoring
#
#   Generated Tue Apr 12 12:00:49 2016  by kkoda
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_SCT_Monitoring_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_SCT_Monitoring_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_SCT_Monitoring

SCT_Monitoring_tag = $(tag)

#cmt_local_tagfile_SCT_Monitoring = $(SCT_Monitoring_tag)_SCT_Monitoring.make
cmt_local_tagfile_SCT_Monitoring = $(bin)$(SCT_Monitoring_tag)_SCT_Monitoring.make

else

tags      = $(tag),$(CMTEXTRATAGS)

SCT_Monitoring_tag = $(tag)

#cmt_local_tagfile_SCT_Monitoring = $(SCT_Monitoring_tag).make
cmt_local_tagfile_SCT_Monitoring = $(bin)$(SCT_Monitoring_tag).make

endif

include $(cmt_local_tagfile_SCT_Monitoring)
#-include $(cmt_local_tagfile_SCT_Monitoring)

ifdef cmt_SCT_Monitoring_has_target_tag

cmt_final_setup_SCT_Monitoring = $(bin)setup_SCT_Monitoring.make
cmt_dependencies_in_SCT_Monitoring = $(bin)dependencies_SCT_Monitoring.in
#cmt_final_setup_SCT_Monitoring = $(bin)SCT_Monitoring_SCT_Monitoringsetup.make
cmt_local_SCT_Monitoring_makefile = $(bin)SCT_Monitoring.make

else

cmt_final_setup_SCT_Monitoring = $(bin)setup.make
cmt_dependencies_in_SCT_Monitoring = $(bin)dependencies.in
#cmt_final_setup_SCT_Monitoring = $(bin)SCT_Monitoringsetup.make
cmt_local_SCT_Monitoring_makefile = $(bin)SCT_Monitoring.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)SCT_Monitoringsetup.make

#SCT_Monitoring :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'SCT_Monitoring'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = SCT_Monitoring/
#SCT_Monitoring::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

SCT_Monitoringlibname   = $(bin)$(library_prefix)SCT_Monitoring$(library_suffix)
SCT_Monitoringlib       = $(SCT_Monitoringlibname).a
SCT_Monitoringstamp     = $(bin)SCT_Monitoring.stamp
SCT_Monitoringshstamp   = $(bin)SCT_Monitoring.shstamp

SCT_Monitoring :: dirs  SCT_MonitoringLIB
	$(echo) "SCT_Monitoring ok"

#-- end of libary_header ----------------
#-- start of library_no_static ------

#SCT_MonitoringLIB :: $(SCT_Monitoringlib) $(SCT_Monitoringshstamp)
SCT_MonitoringLIB :: $(SCT_Monitoringshstamp)
	$(echo) "SCT_Monitoring : library ok"

$(SCT_Monitoringlib) :: $(bin)SCTErrMonTool.o $(bin)SCTHitEffMonTool.o $(bin)SCTHitsNoiseMonTool.o $(bin)SCTLorentzMonTool.o $(bin)SCTMotherTrigMonTool.o $(bin)SCTRatioNoiseMonTool.o $(bin)SCTSummaryMonTool.o $(bin)SCTTracksMonTool.o $(bin)SCT_Monitoring_entries.o $(bin)SCT_Monitoring_load.o
	$(lib_echo) "static library $@"
	$(lib_silent) cd $(bin); \
	  $(ar) $(SCT_Monitoringlib) $?
	$(lib_silent) $(ranlib) $(SCT_Monitoringlib)
	$(lib_silent) cat /dev/null >$(SCT_Monitoringstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

#
# We add one level of dependency upon the true shared library 
# (rather than simply upon the stamp file)
# this is for cases where the shared library has not been built
# while the stamp was created (error??) 
#

$(SCT_Monitoringlibname).$(shlibsuffix) :: $(bin)SCTErrMonTool.o $(bin)SCTHitEffMonTool.o $(bin)SCTHitsNoiseMonTool.o $(bin)SCTLorentzMonTool.o $(bin)SCTMotherTrigMonTool.o $(bin)SCTRatioNoiseMonTool.o $(bin)SCTSummaryMonTool.o $(bin)SCTTracksMonTool.o $(bin)SCT_Monitoring_entries.o $(bin)SCT_Monitoring_load.o $(use_requirements) $(SCT_Monitoringstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) $(shlibbuilder) $(shlibflags) -o $@ $(bin)SCTErrMonTool.o $(bin)SCTHitEffMonTool.o $(bin)SCTHitsNoiseMonTool.o $(bin)SCTLorentzMonTool.o $(bin)SCTMotherTrigMonTool.o $(bin)SCTRatioNoiseMonTool.o $(bin)SCTSummaryMonTool.o $(bin)SCTTracksMonTool.o $(bin)SCT_Monitoring_entries.o $(bin)SCT_Monitoring_load.o $(SCT_Monitoring_shlibflags)
	$(lib_silent) cat /dev/null >$(SCT_Monitoringstamp) && \
	  cat /dev/null >$(SCT_Monitoringshstamp)

$(SCT_Monitoringshstamp) :: $(SCT_Monitoringlibname).$(shlibsuffix)
	$(lib_silent) if test -f $(SCT_Monitoringlibname).$(shlibsuffix) ; then \
	  cat /dev/null >$(SCT_Monitoringstamp) && \
	  cat /dev/null >$(SCT_Monitoringshstamp) ; fi

SCT_Monitoringclean ::
	$(cleanup_echo) objects SCT_Monitoring
	$(cleanup_silent) /bin/rm -f $(bin)SCTErrMonTool.o $(bin)SCTHitEffMonTool.o $(bin)SCTHitsNoiseMonTool.o $(bin)SCTLorentzMonTool.o $(bin)SCTMotherTrigMonTool.o $(bin)SCTRatioNoiseMonTool.o $(bin)SCTSummaryMonTool.o $(bin)SCTTracksMonTool.o $(bin)SCT_Monitoring_entries.o $(bin)SCT_Monitoring_load.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)SCTErrMonTool.o $(bin)SCTHitEffMonTool.o $(bin)SCTHitsNoiseMonTool.o $(bin)SCTLorentzMonTool.o $(bin)SCTMotherTrigMonTool.o $(bin)SCTRatioNoiseMonTool.o $(bin)SCTSummaryMonTool.o $(bin)SCTTracksMonTool.o $(bin)SCT_Monitoring_entries.o $(bin)SCT_Monitoring_load.o) $(patsubst %.o,%.dep,$(bin)SCTErrMonTool.o $(bin)SCTHitEffMonTool.o $(bin)SCTHitsNoiseMonTool.o $(bin)SCTLorentzMonTool.o $(bin)SCTMotherTrigMonTool.o $(bin)SCTRatioNoiseMonTool.o $(bin)SCTSummaryMonTool.o $(bin)SCTTracksMonTool.o $(bin)SCT_Monitoring_entries.o $(bin)SCT_Monitoring_load.o) $(patsubst %.o,%.d.stamp,$(bin)SCTErrMonTool.o $(bin)SCTHitEffMonTool.o $(bin)SCTHitsNoiseMonTool.o $(bin)SCTLorentzMonTool.o $(bin)SCTMotherTrigMonTool.o $(bin)SCTRatioNoiseMonTool.o $(bin)SCTSummaryMonTool.o $(bin)SCTTracksMonTool.o $(bin)SCT_Monitoring_entries.o $(bin)SCT_Monitoring_load.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf SCT_Monitoring_deps SCT_Monitoring_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
SCT_Monitoringinstallname = $(library_prefix)SCT_Monitoring$(library_suffix).$(shlibsuffix)

SCT_Monitoring :: SCT_Monitoringinstall ;

install :: SCT_Monitoringinstall ;

SCT_Monitoringinstall :: $(install_dir)/$(SCT_Monitoringinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(SCT_Monitoringinstallname) :: $(bin)$(SCT_Monitoringinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(SCT_Monitoringinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##SCT_Monitoringclean :: SCT_Monitoringuninstall

uninstall :: SCT_Monitoringuninstall ;

SCT_Monitoringuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(SCT_Monitoringinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of library_no_static ------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),SCT_Monitoringclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)SCTErrMonTool.d

$(bin)$(binobj)SCTErrMonTool.d :

$(bin)$(binobj)SCTErrMonTool.o : $(cmt_final_setup_SCT_Monitoring)

$(bin)$(binobj)SCTErrMonTool.o : $(src)SCTErrMonTool.cxx
	$(cpp_echo) $(src)SCTErrMonTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTErrMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTErrMonTool_cppflags) $(SCTErrMonTool_cxx_cppflags)  $(src)SCTErrMonTool.cxx
endif
endif

else
$(bin)SCT_Monitoring_dependencies.make : $(SCTErrMonTool_cxx_dependencies)

$(bin)SCT_Monitoring_dependencies.make : $(src)SCTErrMonTool.cxx

$(bin)$(binobj)SCTErrMonTool.o : $(SCTErrMonTool_cxx_dependencies)
	$(cpp_echo) $(src)SCTErrMonTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTErrMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTErrMonTool_cppflags) $(SCTErrMonTool_cxx_cppflags)  $(src)SCTErrMonTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),SCT_Monitoringclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)SCTHitEffMonTool.d

$(bin)$(binobj)SCTHitEffMonTool.d :

$(bin)$(binobj)SCTHitEffMonTool.o : $(cmt_final_setup_SCT_Monitoring)

$(bin)$(binobj)SCTHitEffMonTool.o : $(src)SCTHitEffMonTool.cxx
	$(cpp_echo) $(src)SCTHitEffMonTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTHitEffMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTHitEffMonTool_cppflags) $(SCTHitEffMonTool_cxx_cppflags)  $(src)SCTHitEffMonTool.cxx
endif
endif

else
$(bin)SCT_Monitoring_dependencies.make : $(SCTHitEffMonTool_cxx_dependencies)

$(bin)SCT_Monitoring_dependencies.make : $(src)SCTHitEffMonTool.cxx

$(bin)$(binobj)SCTHitEffMonTool.o : $(SCTHitEffMonTool_cxx_dependencies)
	$(cpp_echo) $(src)SCTHitEffMonTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTHitEffMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTHitEffMonTool_cppflags) $(SCTHitEffMonTool_cxx_cppflags)  $(src)SCTHitEffMonTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),SCT_Monitoringclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)SCTHitsNoiseMonTool.d

$(bin)$(binobj)SCTHitsNoiseMonTool.d :

$(bin)$(binobj)SCTHitsNoiseMonTool.o : $(cmt_final_setup_SCT_Monitoring)

$(bin)$(binobj)SCTHitsNoiseMonTool.o : $(src)SCTHitsNoiseMonTool.cxx
	$(cpp_echo) $(src)SCTHitsNoiseMonTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTHitsNoiseMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTHitsNoiseMonTool_cppflags) $(SCTHitsNoiseMonTool_cxx_cppflags)  $(src)SCTHitsNoiseMonTool.cxx
endif
endif

else
$(bin)SCT_Monitoring_dependencies.make : $(SCTHitsNoiseMonTool_cxx_dependencies)

$(bin)SCT_Monitoring_dependencies.make : $(src)SCTHitsNoiseMonTool.cxx

$(bin)$(binobj)SCTHitsNoiseMonTool.o : $(SCTHitsNoiseMonTool_cxx_dependencies)
	$(cpp_echo) $(src)SCTHitsNoiseMonTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTHitsNoiseMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTHitsNoiseMonTool_cppflags) $(SCTHitsNoiseMonTool_cxx_cppflags)  $(src)SCTHitsNoiseMonTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),SCT_Monitoringclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)SCTLorentzMonTool.d

$(bin)$(binobj)SCTLorentzMonTool.d :

$(bin)$(binobj)SCTLorentzMonTool.o : $(cmt_final_setup_SCT_Monitoring)

$(bin)$(binobj)SCTLorentzMonTool.o : $(src)SCTLorentzMonTool.cxx
	$(cpp_echo) $(src)SCTLorentzMonTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTLorentzMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTLorentzMonTool_cppflags) $(SCTLorentzMonTool_cxx_cppflags)  $(src)SCTLorentzMonTool.cxx
endif
endif

else
$(bin)SCT_Monitoring_dependencies.make : $(SCTLorentzMonTool_cxx_dependencies)

$(bin)SCT_Monitoring_dependencies.make : $(src)SCTLorentzMonTool.cxx

$(bin)$(binobj)SCTLorentzMonTool.o : $(SCTLorentzMonTool_cxx_dependencies)
	$(cpp_echo) $(src)SCTLorentzMonTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTLorentzMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTLorentzMonTool_cppflags) $(SCTLorentzMonTool_cxx_cppflags)  $(src)SCTLorentzMonTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),SCT_Monitoringclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)SCTMotherTrigMonTool.d

$(bin)$(binobj)SCTMotherTrigMonTool.d :

$(bin)$(binobj)SCTMotherTrigMonTool.o : $(cmt_final_setup_SCT_Monitoring)

$(bin)$(binobj)SCTMotherTrigMonTool.o : $(src)SCTMotherTrigMonTool.cxx
	$(cpp_echo) $(src)SCTMotherTrigMonTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTMotherTrigMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTMotherTrigMonTool_cppflags) $(SCTMotherTrigMonTool_cxx_cppflags)  $(src)SCTMotherTrigMonTool.cxx
endif
endif

else
$(bin)SCT_Monitoring_dependencies.make : $(SCTMotherTrigMonTool_cxx_dependencies)

$(bin)SCT_Monitoring_dependencies.make : $(src)SCTMotherTrigMonTool.cxx

$(bin)$(binobj)SCTMotherTrigMonTool.o : $(SCTMotherTrigMonTool_cxx_dependencies)
	$(cpp_echo) $(src)SCTMotherTrigMonTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTMotherTrigMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTMotherTrigMonTool_cppflags) $(SCTMotherTrigMonTool_cxx_cppflags)  $(src)SCTMotherTrigMonTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),SCT_Monitoringclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)SCTRatioNoiseMonTool.d

$(bin)$(binobj)SCTRatioNoiseMonTool.d :

$(bin)$(binobj)SCTRatioNoiseMonTool.o : $(cmt_final_setup_SCT_Monitoring)

$(bin)$(binobj)SCTRatioNoiseMonTool.o : $(src)SCTRatioNoiseMonTool.cxx
	$(cpp_echo) $(src)SCTRatioNoiseMonTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTRatioNoiseMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTRatioNoiseMonTool_cppflags) $(SCTRatioNoiseMonTool_cxx_cppflags)  $(src)SCTRatioNoiseMonTool.cxx
endif
endif

else
$(bin)SCT_Monitoring_dependencies.make : $(SCTRatioNoiseMonTool_cxx_dependencies)

$(bin)SCT_Monitoring_dependencies.make : $(src)SCTRatioNoiseMonTool.cxx

$(bin)$(binobj)SCTRatioNoiseMonTool.o : $(SCTRatioNoiseMonTool_cxx_dependencies)
	$(cpp_echo) $(src)SCTRatioNoiseMonTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTRatioNoiseMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTRatioNoiseMonTool_cppflags) $(SCTRatioNoiseMonTool_cxx_cppflags)  $(src)SCTRatioNoiseMonTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),SCT_Monitoringclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)SCTSummaryMonTool.d

$(bin)$(binobj)SCTSummaryMonTool.d :

$(bin)$(binobj)SCTSummaryMonTool.o : $(cmt_final_setup_SCT_Monitoring)

$(bin)$(binobj)SCTSummaryMonTool.o : $(src)SCTSummaryMonTool.cxx
	$(cpp_echo) $(src)SCTSummaryMonTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTSummaryMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTSummaryMonTool_cppflags) $(SCTSummaryMonTool_cxx_cppflags)  $(src)SCTSummaryMonTool.cxx
endif
endif

else
$(bin)SCT_Monitoring_dependencies.make : $(SCTSummaryMonTool_cxx_dependencies)

$(bin)SCT_Monitoring_dependencies.make : $(src)SCTSummaryMonTool.cxx

$(bin)$(binobj)SCTSummaryMonTool.o : $(SCTSummaryMonTool_cxx_dependencies)
	$(cpp_echo) $(src)SCTSummaryMonTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTSummaryMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTSummaryMonTool_cppflags) $(SCTSummaryMonTool_cxx_cppflags)  $(src)SCTSummaryMonTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),SCT_Monitoringclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)SCTTracksMonTool.d

$(bin)$(binobj)SCTTracksMonTool.d :

$(bin)$(binobj)SCTTracksMonTool.o : $(cmt_final_setup_SCT_Monitoring)

$(bin)$(binobj)SCTTracksMonTool.o : $(src)SCTTracksMonTool.cxx
	$(cpp_echo) $(src)SCTTracksMonTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTTracksMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTTracksMonTool_cppflags) $(SCTTracksMonTool_cxx_cppflags)  $(src)SCTTracksMonTool.cxx
endif
endif

else
$(bin)SCT_Monitoring_dependencies.make : $(SCTTracksMonTool_cxx_dependencies)

$(bin)SCT_Monitoring_dependencies.make : $(src)SCTTracksMonTool.cxx

$(bin)$(binobj)SCTTracksMonTool.o : $(SCTTracksMonTool_cxx_dependencies)
	$(cpp_echo) $(src)SCTTracksMonTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCTTracksMonTool_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCTTracksMonTool_cppflags) $(SCTTracksMonTool_cxx_cppflags)  $(src)SCTTracksMonTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),SCT_Monitoringclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)SCT_Monitoring_entries.d

$(bin)$(binobj)SCT_Monitoring_entries.d :

$(bin)$(binobj)SCT_Monitoring_entries.o : $(cmt_final_setup_SCT_Monitoring)

$(bin)$(binobj)SCT_Monitoring_entries.o : $(src)components/SCT_Monitoring_entries.cxx
	$(cpp_echo) $(src)components/SCT_Monitoring_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCT_Monitoring_entries_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCT_Monitoring_entries_cppflags) $(SCT_Monitoring_entries_cxx_cppflags) -I../src/components $(src)components/SCT_Monitoring_entries.cxx
endif
endif

else
$(bin)SCT_Monitoring_dependencies.make : $(SCT_Monitoring_entries_cxx_dependencies)

$(bin)SCT_Monitoring_dependencies.make : $(src)components/SCT_Monitoring_entries.cxx

$(bin)$(binobj)SCT_Monitoring_entries.o : $(SCT_Monitoring_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/SCT_Monitoring_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCT_Monitoring_entries_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCT_Monitoring_entries_cppflags) $(SCT_Monitoring_entries_cxx_cppflags) -I../src/components $(src)components/SCT_Monitoring_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),SCT_Monitoringclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)SCT_Monitoring_load.d

$(bin)$(binobj)SCT_Monitoring_load.d :

$(bin)$(binobj)SCT_Monitoring_load.o : $(cmt_final_setup_SCT_Monitoring)

$(bin)$(binobj)SCT_Monitoring_load.o : $(src)components/SCT_Monitoring_load.cxx
	$(cpp_echo) $(src)components/SCT_Monitoring_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCT_Monitoring_load_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCT_Monitoring_load_cppflags) $(SCT_Monitoring_load_cxx_cppflags) -I../src/components $(src)components/SCT_Monitoring_load.cxx
endif
endif

else
$(bin)SCT_Monitoring_dependencies.make : $(SCT_Monitoring_load_cxx_dependencies)

$(bin)SCT_Monitoring_dependencies.make : $(src)components/SCT_Monitoring_load.cxx

$(bin)$(binobj)SCT_Monitoring_load.o : $(SCT_Monitoring_load_cxx_dependencies)
	$(cpp_echo) $(src)components/SCT_Monitoring_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(SCT_Monitoring_pp_cppflags) $(lib_SCT_Monitoring_pp_cppflags) $(SCT_Monitoring_load_pp_cppflags) $(use_cppflags) $(SCT_Monitoring_cppflags) $(lib_SCT_Monitoring_cppflags) $(SCT_Monitoring_load_cppflags) $(SCT_Monitoring_load_cxx_cppflags) -I../src/components $(src)components/SCT_Monitoring_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: SCT_Monitoringclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(SCT_Monitoring.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

SCT_Monitoringclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library SCT_Monitoring
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)SCT_Monitoring$(library_suffix).a $(library_prefix)SCT_Monitoring$(library_suffix).$(shlibsuffix) SCT_Monitoring.stamp SCT_Monitoring.shstamp
#-- end of cleanup_library ---------------
