# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.13

EAPI="3"

CABAL_FEATURES="bin lib profile haddock hscolour"
inherit haskell-cabal versionator

MY_PN="HDBC"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Haskell Database Connectivity"
HOMEPAGE="http://software.complete.org/hdbc"
SRC_URI="http://hackage.haskell.org/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE="odbc postgres sqlite3"

RDEPEND=">=dev-haskell/convertible-1.0.10.0
		dev-haskell/hunit
		dev-haskell/mtl
		dev-haskell/quickcheck
		dev-haskell/testpack
		dev-haskell/text
		>=dev-haskell/time-1.1.3
		dev-haskell/utf8-string
		>=dev-lang/ghc-6.8.2"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8"

DEPENDV="$(get_version_component_range 1-2)"
PDEPEND="odbc? ( =dev-haskell/hdbc-odbc-${DEPENDV}* )
		postgres? ( =dev-haskell/hdbc-postgresql-${DEPENDV}* )
		sqlite3? ( >=dev-haskell/hdbc-sqlite-${DEPENDV} )"

S="${WORKDIR}/${MY_P}"
