# Copyright 2024 Sylvain PHILIP
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome2-utils meson xdg git-r3

DESCRIPTION="A note-taking application that streamlines the process with the use of markdown syntax."
HOMEPAGE="https://gitlab.gnome.org/ilhooq/bookup"
EGIT_REPO_URI="https://gitlab.gnome.org/ilhooq/bookup.git"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	gui-libs/gtk
	gui-libs/gtksourceview
	gui-libs/libadwaita
	net-libs/webkit-gtk:6
	dev-db/sqlite
	app-text/discount
"

BDEPEND="
	>=sys-devel/gettext-0.18
	virtual/pkgconfig
"

src_prepare() {
	default
	xdg_environment_reset
}

src_configure() {
	meson_src_configure
}

src_install() {
	meson_src_install
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}

