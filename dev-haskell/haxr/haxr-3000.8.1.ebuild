# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="3"

CABAL_FEATURES="lib profile haddock hscolour"
inherit haskell-cabal

DESCRIPTION="XML-RPC client and server library."
HOMEPAGE="http://www.haskell.org/haskellwiki/HaXR"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="<dev-haskell/blaze-builder-0.4
		dev-haskell/dataenc
		=dev-haskell/haxml-1.20*
		>=dev-haskell/http-4000
		dev-haskell/mtl
		<dev-haskell/network-3
		dev-haskell/time
		dev-haskell/utf8-string
		>=dev-lang/ghc-6.8.2"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"

src_prepare() {
	sed -e 's@blaze-builder == 0.2.\*@blaze-builder >= 0.2 \&\& < 0.4@' \
		-i "${S}/${PN}.cabal" || die "Could not loosen blaze-builder dependency in ${S}/${PN}.cabal"
}
