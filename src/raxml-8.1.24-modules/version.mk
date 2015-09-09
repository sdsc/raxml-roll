ROLLCOMPILER=intel
ROLLMPI=openmpi_ib
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))
MPINAME := $(firstword $(subst /, ,$(ROLLMPI)))

PACKAGE     = raxml
CATEGORY    = applications

NAME        = sdsc-$(PACKAGE)-8.1.24-modules
RELEASE     = 3
PKGROOT     = /opt/modulefiles/$(CATEGORY)/$(PACKAGE)

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)-8.1.24/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No
