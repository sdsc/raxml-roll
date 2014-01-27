PKGROOT            = /opt/raxml
NAME               = raxml
VERSION            = 8.0.0
RELEASE            = 2
TARBALL_POSTFIX    = tar

SRC_SUBDIR         = raxml

SOURCE_NAME        = RAxML
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_NAME)-$(SOURCE_VERSION)

TAR_PKGS           = $(SOURCE_PKG)
RPM.EXTRAS         = AutoReq:No
