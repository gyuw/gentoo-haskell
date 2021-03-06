# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:	$

# ebuild generated by hackport 0.2.9

EAPI="2"
CABAL_FEATURES="lib profile haddock hscolour"
inherit haskell-cabal

DESCRIPTION="Utility libraries for the advanced IRC bot, Lambdabot"
HOMEPAGE="http://haskell.org/haskellwiki/Lambdabot"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/binary
		dev-haskell/haskell-src
		dev-haskell/mtl
		dev-haskell/network
		dev-haskell/regex-compat
		dev-haskell/regex-posix
		>dev-haskell/tagsoup-0.6
		dev-haskell/utf8-string
		dev-haskell/zlib
		>=dev-lang/ghc-6.8.1"
DEPEND="${RDEPEND}
		dev-haskell/cabal"
