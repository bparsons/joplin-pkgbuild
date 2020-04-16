#!/bin/env bash

#
# Clean up the build directories from previous package builds
#

PKGNAME="joplin"

# Move any old package files to packages directory
[[ $(ls -1 | grep pkg.tar.xz | wc -l) -gt 0 ]] && {
    [[ -d packages ]] || { mkdir packages; }
    mv *.pkg.tar.xz packages/;
}

# Remove old package build files
rm -rf src
rm -rf pkg

# Remove old package source (keep current)
CURRENTVER=$(grep 'pkgver=' ./PKGBUILD | awk -F= '{print$2}')
ls -1 | grep "^${PKGNAME}\-.*.tar.gz" | grep -v ${CURRENTVER} |
while read inl
do
    rm -f $inl
done
