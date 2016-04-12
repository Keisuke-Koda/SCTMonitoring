#-- start of make_header -----------------

#====================================
#  Document SCT_Monitoring_optdebug_library
#
#   Generated Tue Apr 12 10:48:57 2016  by dhayakaw
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_SCT_Monitoring_optdebug_library_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_SCT_Monitoring_optdebug_library_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_SCT_Monitoring_optdebug_library

SCT_Monitoring_tag = $(tag)

#cmt_local_tagfile_SCT_Monitoring_optdebug_library = $(SCT_Monitoring_tag)_SCT_Monitoring_optdebug_library.make
cmt_local_tagfile_SCT_Monitoring_optdebug_library = $(bin)$(SCT_Monitoring_tag)_SCT_Monitoring_optdebug_library.make

else

tags      = $(tag),$(CMTEXTRATAGS)

SCT_Monitoring_tag = $(tag)

#cmt_local_tagfile_SCT_Monitoring_optdebug_library = $(SCT_Monitoring_tag).make
cmt_local_tagfile_SCT_Monitoring_optdebug_library = $(bin)$(SCT_Monitoring_tag).make

endif

include $(cmt_local_tagfile_SCT_Monitoring_optdebug_library)
#-include $(cmt_local_tagfile_SCT_Monitoring_optdebug_library)

ifdef cmt_SCT_Monitoring_optdebug_library_has_target_tag

cmt_final_setup_SCT_Monitoring_optdebug_library = $(bin)setup_SCT_Monitoring_optdebug_library.make
cmt_dependencies_in_SCT_Monitoring_optdebug_library = $(bin)dependencies_SCT_Monitoring_optdebug_library.in
#cmt_final_setup_SCT_Monitoring_optdebug_library = $(bin)SCT_Monitoring_SCT_Monitoring_optdebug_librarysetup.make
cmt_local_SCT_Monitoring_optdebug_library_makefile = $(bin)SCT_Monitoring_optdebug_library.make

else

cmt_final_setup_SCT_Monitoring_optdebug_library = $(bin)setup.make
cmt_dependencies_in_SCT_Monitoring_optdebug_library = $(bin)dependencies.in
#cmt_final_setup_SCT_Monitoring_optdebug_library = $(bin)SCT_Monitoringsetup.make
cmt_local_SCT_Monitoring_optdebug_library_makefile = $(bin)SCT_Monitoring_optdebug_library.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)SCT_Monitoringsetup.make

#SCT_Monitoring_optdebug_library :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'SCT_Monitoring_optdebug_library'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = SCT_Monitoring_optdebug_library/
#SCT_Monitoring_optdebug_library::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of optdebug_library_header ------
# create  a  two  part  executable.   One  a
# stripped  binary  which will occupy less space in RAM and in a dis-
# tribution and the second a debugging information file which is only
# needed  if  debugging abilities are required
# See GNU binutils OBJCOPY(1)
# http://sourceware.org/binutils/docs-2.17/binutils/objcopy.html#objcopy

depend=$(bin)$(library_prefix)SCT_Monitoring.$(shlibsuffix)
target=$(depend)$(debuginfosuffix)

SCT_Monitoring_optdebug_library :: $(target) ;

$(target) : $(depend)
	$(echo) stripping dbg symbols into separate file $@
	$(link_silent) objcopy --only-keep-debug $< $@
	$(link_silent) objcopy --strip-debug $<
	$(link_silent) cd $(@D) && objcopy --add-gnu-debuglink=$(@F) $(<F)
	$(link_silent) touch -c $@

SCT_Monitoring_optdebug_libraryclean ::
	$(cleanup_silent) /bin/rm -f $(target)

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
SCT_Monitoring_optdebug_libraryinstallname = $(library_prefix)SCT_Monitoring$(library_suffix).$(shlibsuffix)$(debuginfosuffix)

SCT_Monitoring_optdebug_library :: SCT_Monitoring_optdebug_libraryinstall ;

install :: SCT_Monitoring_optdebug_libraryinstall ;

SCT_Monitoring_optdebug_libraryinstall :: $(install_dir)/$(SCT_Monitoring_optdebug_libraryinstallname)
ifdef CMTINSTALLAREA
	$(echo) "$(SCT_Monitoring_optdebug_libraryinstallname) installation done"
endif

$(install_dir)/$(SCT_Monitoring_optdebug_libraryinstallname) :: $(bin)$(SCT_Monitoring_optdebug_libraryinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(SCT_Monitoring_optdebug_libraryinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##SCT_Monitoring_optdebug_libraryclean :: SCT_Monitoring_optdebug_libraryuninstall

uninstall :: SCT_Monitoring_optdebug_libraryuninstall ;

SCT_Monitoring_optdebug_libraryuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(SCT_Monitoring_optdebug_libraryinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- start of optdebug_library_header ------
#-- start of cleanup_header --------------

clean :: SCT_Monitoring_optdebug_libraryclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(SCT_Monitoring_optdebug_library.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

SCT_Monitoring_optdebug_libraryclean ::
#-- end of cleanup_header ---------------