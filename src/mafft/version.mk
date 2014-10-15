PKGROOT            = /opt/mafft
NAME               = mafft
VERSION            = 7.187
RELEASE            = 0
TARBALL_POSTFIX    = tgz

SRC_SUBDIR         = mafft

SOURCE_NAME        = mafft-$(VERSION)-with-extensions-src
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tgz
SOURCE_PKG         = $(SOURCE_NAME).$(SOURCE_SUFFIX)
SOURCE_DIR         = mafft-$(VERSION)-with-extensions

TGZ_PKGS           = $(SOURCE_PKG)
RPM.EXTRAS         = AutoReq:No
