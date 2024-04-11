#!/bin/sh
#
# Python/PIP Tools

# https://github.com/kdeldycke/meta-package-manager
if test ! $(which mpm)
then
  pipx install meta_package_manager
fi
