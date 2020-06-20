#/bin/env bash

#
# Update Version for Joplin PKGBUILD
#
# Brian Parsons <bp@brianparsons.com>
#

PKGNAME="joplin"

[[ ${1} ]] && [[ ${1-x} ]] || { echo "Please specify version: $0 <version> (example: 1.0.200)"; exit 1; }

UPDATEVER=$1

# Update Desktop file, get new sha256sum
CURSUM=$(sha256sum ${PKGNAME}.desktop | awk '{print$1}')
sed -i "s/Version=.*/Version=${UPDATEVER}/g" ${PKGNAME}.desktop
sleep 3
NEWSUM=$(sha256sum ${PKGNAME}.desktop | awk '{print$1}')
sed -i "s/${CURSUM}/${NEWSUM}/g" PKGBUILD

# Update PKGBUILD
sed -i "s/pkgver=.*/pkgver=${UPDATEVER}/g" PKGBUILD

# clean
./clean.sh

# build
./build.sh

