# $Id$
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		         version 5.6 (Emerald Boa)
# 		         version 6.1 (Emerald Boa)
# 
# Copyright (c) 2000 - 2013 The Regents of the University of California.
# All rights reserved.	
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright
# notice unmodified and in its entirety, this list of conditions and the
# following disclaimer in the documentation and/or other materials provided 
# with the distribution.
# 
# 3. All advertising and press materials, printed or electronic, mentioning
# features or use of this software must display the following acknowledgement: 
# 
# 	"This product includes software developed by the Rocks(r)
# 	Cluster Group at the San Diego Supercomputer Center at the
# 	University of California, San Diego and its contributors."
# 
# 4. Except as permitted for the purposes of acknowledgment in paragraph 3,
# neither the name or logo of this software nor the names of its
# authors may be used to endorse or promote products derived from this
# software without specific prior written permission.  The name of the
# software includes the following terms, and any derivatives thereof:
# "Rocks", "Rocks Clusters", and "Avalanche Installer".  For licensing of 
# the associated name, interested parties should contact Technology 
# Transfer & Intellectual Property Services, University of California, 
# San Diego, 9500 Gilman Drive, Mail Code 0910, La Jolla, CA 92093-0910, 
# Ph: (858) 534-5815, FAX: (858) 534-7345, E-MAIL:invent@ucsd.edu
# 
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# @Copyright@
#
# $Log$

REDHAT.ROOT = $(CURDIR)/../../

ROLLCOMPILER=intel
ROLLMPI=openmpi_ib
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))
MPINAME := $(firstword $(subst /, ,$(ROLLMPI)))

AVX_FLAG=
ifneq ("$(ROLLOPTS)", "$(subst avx2,,$(ROLLOPTS))")
      AVX_FLAG = -xcore-avx2
else ifneq ("$(ROLLOPTS)", "$(subst avx,,$(ROLLOPTS))")
      AVX_FLAG = -xavx
endif


 
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Pull.mk
include $(SDSCDEVEL)/Rules.mk

$(NAME).spec: DESCRIPTION LICENSE

DESCRIPTION:
	$(MODULE_LOAD_CC); \
	( \
	  $(DESCRIBE_PKG); \
	  $(DESCRIBE_CC); \
	  $(DESCRIBE_MPI); \
	) > $@

LICENSE: $(SRC_DIRS)
	$(CHECK_LICENSE_FILES)
	echo Kazutaka Katoh > $@

build: $(SRC_DIRS)
	( \
           . /etc/profile.d/modules.sh; \
           $(MODULE_LOAD_CC); \
           $(MODULE_LOAD_MPI); \
           patch $(SOURCE_DIR)/core/Makefile patch-files/Makefile.core.patch; \
           patch $(SOURCE_DIR)/extensions/Makefile patch-files/Makefile.extensions.patch; \
           patch $(SOURCE_DIR)/extensions/mxscarna_src/Makefile patch-files/Makefile.mxscarna_src.patch; \
	   perl -pi -e "s!ROLLPREFIX!$(PKGROOT)!" $(SOURCE_DIR)/core/Makefile; \
	   perl -pi -e "s!ROLLPREFIX!$(PKGROOT)!" $(SOURCE_DIR)/extensions/Makefile; \
	   perl -pi -e "s!AVX_FLAG!$(AVX_FLAG)!" $(SOURCE_DIR)/core/Makefile; \
	   perl -pi -e "s!AVX_FLAG!$(AVX_FLAG)!" $(SOURCE_DIR)/extensions/Makefile; \
	   perl -pi -e "s!AVX_FLAG!$(AVX_FLAG)!" $(SOURCE_DIR)/extensions/mxscarna_src/Makefile; \
           cd $(SOURCE_DIR)/core; \
           make; \
           cd ../extensions; \
           make \
	)
	@echo "::: Package $(NAME) build complete :::"
	
install::
	mkdir -p $(ROOT)/$(PKGROOT)
	mkdir -p $(PKGROOT)
	mkdir -p $(REDHAT.ROOT)/src/build-raxml-modules
	$(call BIND_MOUNT, $(PKGROOT), $(ROOT)/$(PKGROOT))
	( \
             cd $(SOURCE_DIR); \
             cp -r binaries $(PKGROOT); \
             chmod 0775 $(PKGROOT)/binaries; \
             cp -r test $(PKGROOT); \
             chmod 0755 $(PKGROOT)/test; \
             chmod 0644 $(PKGROOT)/test/*; \
             cd core; \
             make install \
	)
	$(call BIND_UMOUNT, $(PKGROOT))
	@echo "::: Package $(NAME) install complete :::"

clean::
	rm -rf $(SOURCE_DIR) DESCRIPTION LICENSE
