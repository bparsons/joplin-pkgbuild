# Joplin PKGBUILD for Arch Linux

## Overview

Forked from [https://github.com/alfredopalhares/arch-pkgbuilds](https://github.com/alfredopalhares/arch-pkgbuilds), this contains the PKGBUILD and other build tools to package
[Joplin](https://joplin.cozic.net/) for Arch Linux. 

This fork contains some additional helper scripts:

### updateversion.sh 

This script updates the version number in the PKGBUILD and joplin.desktop file, cleans, and builds the updated package.  

Usage:

```
./updateversion.sh <version>
```

Example: ./updateversion.sh 1.0.118

### build.sh

This script builds the package (but does not clean first).

### clean.sh

This script cleans the pkg and src directories and is meant to run when a fresh build is needed.
