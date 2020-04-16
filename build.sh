#!/bin/env bash

#
# Build Package
#

makepkg && {
    makepkg --printsrcinfo > .SRCINFO
}
