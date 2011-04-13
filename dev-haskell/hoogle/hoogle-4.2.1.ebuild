# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="3"

CABAL_FEATURES="bin lib profile haddock hscolour"
inherit haskell-cabal

DESCRIPTION="Haskell API Search"
HOMEPAGE="http://www.haskell.org/hoogle/"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/binary
		<dev-haskell/blaze-builder-0.4
		=dev-haskell/cabal-1.10*
		=dev-haskell/cmdargs-0.6*
		=dev-haskell/enumerator-0.4*
		<dev-haskell/haskell-src-exts-1.11
		>=dev-haskell/parsec-2.1
		dev-haskell/safe
		=dev-haskell/tagsoup-0.12*
		dev-haskell/time
		=dev-haskell/transformers-0.2*
		=dev-haskell/uniplate-1.6*
		=dev-haskell/wai-0.3*
		=dev-haskell/warp-0.3*
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"


src_prepare() {
	# Loosen dependency on parsec
	sed -i -e "s/parsec == 2.1.*,/parsec >= 2.1,/" \
		"${S}/${PN}.cabal" \
		|| die "Could not loosen deps on parsec"
	# Loosen dependency on wai
	sed -i -e "s/wai == 0.3.0/wai >= 0.3.0 \&\& < 0.4.0/" \
		"${S}/${PN}.cabal" \
		|| die "Could not loosen deps on wai"
	# Loosen dependency on warp
	sed -i -e "s/warp == 0.3.0/warp >= 0.3.0 \&\& < 0.4.0/" \
		"${S}/${PN}.cabal" \
		|| die "Could not loosen deps on warp"
	# Loosen dependency on blaze-builder
	sed -i -e "s/blaze-builder == 0.2.\*/blaze-builder >= 0.2 \&\& < 0.4/" \
		"${S}/${PN}.cabal" \
		|| die "Could not loosen deps on blaze-builder"
	sed -i -e "s/statusOK = status200/-- statusOK = status200/" \
		"${S}/src/General/Web.hs"
}
