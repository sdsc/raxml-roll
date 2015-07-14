ROLLCOMPILER=intel
ROLLMPI=openmpi_ib
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))
MPINAME := $(firstword $(subst /, ,$(ROLLMPI)))

PACKAGE     = garli
CATEGORY    = applications

NAME        = sdsc-$(PACKAGE)-modules
RELEASE     = 1
PKGROOT     = /opt/modulefiles/$(CATEGORY)/$(PACKAGE)

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No
