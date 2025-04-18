#!/bin/sh
#

set -ex

#ln -s "./karabiner.json" "${HOME}/.config/karabiner/karabiner.json"

# Create symlink
rm -rf "${HOME}/.config/karabiner"
ln -s "${HOME}/.karabiner/" "${HOME}/.config/karabiner"
