# Maintainer: Alfredo Palhares <alfredo at palhares dot me>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Brian Parsons <bp at brianparsons dot com>

# Contribute to: https://github.com/alfredopalhares/arch-pkgbuilds

pkgbase=joplin
pkgname=(joplin-desktop joplin-cli)
pkgver=1.6.8
pkgrel=1
pkgdesc="A note taking and to-do application with synchronization capabilities"
arch=('x86_64' 'i686')
makedepends=('git' 'npm' 'python' 'rsync')
url="https://joplinapp.org/"
license=('MIT')
source=("joplin.desktop" 
        "joplin-desktop.sh"
        "joplin.sh"
        "${pkgname}-${pkgver}.tar.gz::https://github.com/laurent22/joplin/archive/v${pkgver}.tar.gz")
sha256sums=('2917c3f0e9f80a7e5fc803977e04ccee5237d293c68247baec54e46019e127b0'
            '132afd9b28781aa17d06c133dfffc5a440b27b2a9b5f90ed688d1c4bf2d2f44c'
            '474bacbfba487c2113e4e4d747e1a7710055ae58353b9f97fcbb68db1ec769b9'
            'SKIP')

build() {

  export LANG=en_US.utf8

  cd "${srcdir}/${pkgbase}-${pkgver}"

  # Remove husky (git hooks) from dependencies
  sed -i '/"husky": ".*"/d' package.json

  # npm install
  npm install --cache "${srcdir}/npm-cache"

  # cli
  cd "${srcdir}/${pkgbase}-${pkgver}/packages/app-cli"
  npm run build

  # desktop app
  cd "${srcdir}/${pkgbase}-${pkgver}/packages/app-desktop"
  npm run dist

}

package_joplin-cli() {

depends=('libexif' 'libgsf' 'libjpeg-turbo' 'libwebp' 'libxss' 'nodejs' 'nss' 'orc')
conflicts=('joplin')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  install -d ${pkgdir}/usr/share/{${pkgname},${pkgname}/app}

  cp -R packages/app-cli/build/* "${pkgdir}/usr/share/${pkgname}/app/"
  cp -R packages/app-cli/node_modules "${pkgdir}/usr/share/${pkgname}/app/"
  cp -R packages/lib "${pkgdir}/usr/share/${pkgname}" 
  cp -R packages/fork-htmlparser2 "${pkgdir}/usr/share/${pkgname}"
  cp -R packages/renderer "${pkgdir}/usr/share/${pkgname}"

  install -Dm755 ${srcdir}/joplin.sh "${pkgdir}/usr/bin/joplin"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

}

package_joplin-desktop() {
conflicts=('joplin')

depends=('gtk3' 'libexif' 'libgsf' 'libjpeg-turbo' 'libwebp' 'libxss' 'nodejs' 'nss' 'orc')
optdepends=('libappindicator-gtk3: for tray icon')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  install -d ${pkgdir}/usr/share/${pkgname}

  cp -R packages/app-desktop/dist/linux-unpacked/* "${pkgdir}/usr/share/${pkgname}"

  install -Dm755 ${srcdir}/joplin-desktop.sh "${pkgdir}/usr/bin/joplin-desktop"

  install -Dm644 ${srcdir}/joplin.desktop -t "${pkgdir}/usr/share/applications"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Remove unneeded architecture files
  rm -rf "${pkgdir}/usr/share/${pkgname}/resources/app/node_modules/7zip-bin-linux"/arm*

}
