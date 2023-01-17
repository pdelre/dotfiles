#!/bin/sh
#
# NPM Tools

if test ! $(which catj)
then
  npm install -g catj
fi

if test ! $(which gnomon)
then
  npm install -g gnomon
fi

if test ! $(which markdownlint)
then
  npm install -g markdownlint-cli
fi

if test ! $(which watchman-processor)
then
  npm install -g watchman-processor
fi
