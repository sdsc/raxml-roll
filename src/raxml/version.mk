PKGROOT            = /opt/raxml
NAME               = raxml
VERSION            = 8.0.24
RELEASE            = 6
TARBALL_POSTFIX    = tar.gz

SRC_SUBDIR         = raxml

SOURCE_NAME        = standard-RAxML
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_NAME)-$(SOURCE_VERSION)

TAR_GZ_PKGS           = $(SOURCE_PKG)
RPM.EXTRAS         = AutoReq:No
