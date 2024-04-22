#!/bin/sh
#

set -ex

# Create symlink
rmdir "${HOME}/Library/Application Support/xbar/plugins"
ln -s "${HOME}/.xbar_plugins/" "${HOME}/Library/Application Support/xbar/plugins"
