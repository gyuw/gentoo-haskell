# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.9

CABAL_FEATURES="lib profile haddock hscolour"
inherit haskell-cabal

MY_PN="MonadRandom"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Random-number generation monad."
HOMEPAGE="http://hackage.haskell.org/package/monadrandom"
SRC_URI="http://hackage.haskell.org/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/mtl
		>=dev-lang/ghc-6.8.1"
DEPEND="${RDEPEND}
		dev-haskell/cabal"

S="${WORKDIR}/${MY_P}"
