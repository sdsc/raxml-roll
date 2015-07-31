PKGROOT            = /opt/garli
NAME               = sdsc-garli
VERSION            = 2.01
RELEASE            = 7
TARBALL_POSTFIX    = tar.gz

SRC_SUBDIR         = garli

SOURCE_NAME        = garli
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS           = $(SOURCE_PKG)
RPM.EXTRAS         = AutoReq:No

