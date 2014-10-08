PKGROOT            = /opt/mafft
NAME               = mafft
VERSION            = 7.058
RELEASE            = 5
TARBALL_POSTFIX    = tar

SRC_SUBDIR         = mafft

SOURCE_NAME        = mafft-$(VERSION)-with-extensions-src
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar
SOURCE_PKG         = $(SOURCE_NAME).$(SOURCE_SUFFIX)
SOURCE_DIR         = mafft-$(VERSION)-with-extensions

TAR_PKGS           = $(SOURCE_PKG)
RPM.EXTRAS         = AutoReq:No
