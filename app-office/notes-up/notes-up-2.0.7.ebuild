# Copyright 2022 Sylvain PHILIP
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome.org gnome2-utils meson vala xdg

DESCRIPTION="Markdown notes editor and notes manager "

HOMEPAGE="https://github.com/ilhooq/Notes-up"

SRC_URI="https://github.com/ilhooq/Notes-up/archive/refs/tags/${PV}.tar.gz"

S="${WORKDIR}/Notes-up-${PV}"

LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~amd64"

IUSE=""

DEPEND="
	>=dev-libs/granite-6.0.0
	>=dev-libs/libgee-0.20.6[introspection]
	>=x11-libs/gtksourceview-4.8.2:4[introspection,vala]
	>=x11-libs/gtk+-3.24.34:3[introspection]
	>=net-libs/webkit-gtk-2.36.7:4.1[introspection]
	dev-db/sqlite
	>=app-text/gtkspell-3.0.10:3[introspection,vala]
	app-text/discount
"

RDEPEND="${DEPEND}
		x11-themes/adwaita-icon-theme
		gnome-base/gsettings-desktop-schemas
"

BDEPEND="
	$(vala_depend)
	>=sys-devel/gettext-0.18
	virtual/pkgconfig
"

src_prepare() {
	default
	vala_setup
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

