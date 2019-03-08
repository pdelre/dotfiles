#!/bin/sh
#
# zgen
#
# https://github.com/tarjoilija/zgen#installation

if [ ! -d "${HOME}/.zgen" ]; then
    echo "Installing zgen."
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

echo "zgen Exists!"
