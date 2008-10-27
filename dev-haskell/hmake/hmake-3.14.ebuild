# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/hmake/hmake-3.10.ebuild,v 1.7 2006/03/16 14:13:49 dcoutts Exp $

inherit base eutils ghc-package flag-o-matic

DESCRIPTION="A make tool for Haskell programs"
HOMEPAGE="http://www.haskell.org/hmake/"
SRC_URI="http://www.haskell.org/hmake/${P}.tar.gz"

LICENSE="nhc98"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

DEPEND=">=dev-lang/ghc-6.4
		sys-libs/readline
		>=sys-apps/sandbox-1.2.12"
RDEPEND="sys-libs/readline"

# sandbox dependency due to bug #97441, #101433

# if using readline, hmake depends also on ncurses; but
# readline already has this dependency

src_unpack() {
	unpack ${A}

	filter-ldflags -Wl,-O1 -Wl,--as-needed
}

src_compile() {
	# package uses non-standard configure, therefore econf does
	# not work ...
	READLINE='-package readline' ./configure \
		--prefix=/usr \
		--mandir=/usr/share/man/man1 \
		--buildwith="$(ghc-getghc)" \
		|| die "./configure failed"

	# emake tested; parallel make does not work
	emake -j1 || die "make failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dohtml docs/hmake/*
}