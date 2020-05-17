#/bin/env bash

#
# Update Version
#

PKGNAME="joplin"

[[ ${1} ]] && [[ ${1-x} ]] || { echo "Please specify version: $0 <version> (example: 1.0.200)"; exit 1; }

UPDATEVER=$1

# Update Desktop file, get new sha256sum
cursum=$(sha256sum ${PKGNAME}.desktop)
sed -i "s/Version=.*/Version=${UPDATEVER}/g" ${PKGNAME}.desktop && {
 newsum=$(sha256sum ${PKGNAME}.desktop)
}

# Update PKGBUILD
sed -i "s/pkgver=.*/pkgver=${UPDATEVER}/g" PKGBUILD
sed -i "s/${cursum}/${newsum}/g" PKGBUILD

# clean
./clean.sh

# build
./build.sh

