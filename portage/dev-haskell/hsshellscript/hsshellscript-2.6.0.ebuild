# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/hsshellscript/hsshellscript-2.6.0.ebuild,v 1.3 2006/03/01 19:40:43 hansmi Exp $

inherit base eutils multilib ghc-package

DESCRIPTION="A Haskell library for UNIX shell scripting tasks"
HOMEPAGE="http://www.volker-wysk.de/hsshellscript/"
SRC_URI="http://www.volker-wysk.de/hsshellscript/dist/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~ppc ~x86"
IUSE=""

DEPEND=">=virtual/ghc-6.4
	>=dev-libs/glib-2.0
	>=dev-haskell/haddock-0.6"
RDEPEND=""

HSLIB=/usr/$(get_libdir)/hsshellscript

src_unpack() {
	base_src_unpack
	cd ${S}
	sed -i -e "/ghc-pkg/d" Makefile
}

src_compile() {
	# Fix hsshellscript.cabal library path
	sed -i "s:@DEST_LIB:${HSLIB}:" \
	        ${S}/lib/hsshellscript.cabal
	sed -i "s:@DEST_IMPORTS:${HSLIB}/imports:" \
			${S}/lib/hsshellscript.cabal
	emake || die "emake failed"
}

src_install() {
	# we register the .cabal file generated by make
	ghc-setup-pkg ${S}/build/hsshellscript.cabal
	make install \
		DESTDIR="${D}" \
		DEST_LIB="${HSLIB}" \
		DEST_IMPORTS="${HSLIB}/imports" \
		DEST_DOC="/usr/share/doc/${PF}" \
		|| die "make failed"
	ghc-makeghcilib ${D}/${HSLIB}/libhsshellscript.a
	ghc-install-pkg
	fperms 0644 ${HSLIB}/imports/hsshellscript.h
}
