PKGROOT            = /opt/raxml
NAME               = sdsc-raxml
VERSION            = 8.1.24
RELEASE            = 0
TARBALL_POSTFIX    = tar.gz

SRC_SUBDIR         = raxml

SOURCE_NAME        = raxml
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_NAME)-$(SOURCE_VERSION)

TAR_GZ_PKGS           = $(SOURCE_PKG)
RPM.EXTRAS         = AutoReq:No
