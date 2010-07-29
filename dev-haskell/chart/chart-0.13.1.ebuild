# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.7

CABAL_FEATURES="lib profile haddock hscolour"
inherit haskell-cabal

MY_PN="Chart"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A library for generating 2D Charts and Plots"
HOMEPAGE="http://www.dockerz.net/software/chart.html"
SRC_URI="http://hackage.haskell.org/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/cairo-0.9.11
		>=dev-haskell/colour-2.2.1
		=dev-haskell/data-accessor-0.2*
		<dev-haskell/data-accessor-template-0.3
		>=dev-haskell/gtk-0.9.11
		dev-haskell/mtl
		dev-haskell/time
		>=dev-lang/ghc-6.8.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"

S="${WORKDIR}/${MY_P}"