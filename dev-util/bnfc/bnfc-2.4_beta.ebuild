# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/bnfc/bnfc-2.1.2.ebuild,v 1.3 2005/05/03 20:47:10 dholm Exp $

inherit base ghc-package eutils

MY_PN="BNFC"
MY_PV="${PV%%_beta*}"

IS_BETA="${PV%%*_beta*}"
[[ -z "${IS_BETA}" ]] && MY_PV+=b

DESCRIPTION="BNF Converter -- a sophisticated parser generator"
HOMEPAGE="http://www.cs.chalmers.se/~markus/BNFC/"
SRC_URI="http://www.cs.chalmers.se/Cs/Research/Language-technology/BNFC/download/${MY_PN}-${MY_PV}.tgz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~amd64"

IUSE="doc"

DEPEND=">=dev-lang/ghc-6.6
	doc? ( virtual/latex-base )"

RDEPEND="virtual/libc"

S="${WORKDIR}/${MY_PN}"

src_compile() {
	emake GHC="$(ghc-getghc) -O -fasm" || die "emake failed"
	if use doc ; then
		cd doc
		pdflatex LBNF-report.tex
		pdflatex LBNF-report.tex
	fi
}

src_install() {
	dobin bnfc
	if use doc ; then
		cd doc
		insinto "/usr/share/doc/${P}"
		doins LBNF-report.pdf
	fi
}