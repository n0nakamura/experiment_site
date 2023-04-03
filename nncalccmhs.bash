#!/bin/bash

function error() {
  printf "\e[31mERROR:\e[0m $1\n"
}

function command-exists()
if ! which $1 > /dev/null 2>&1; then
  error "command not found: $1"
  exit 1
fi

command-exists git
command-exists wc
command-exists sha1sum
command-exists sed

TREE="d836e112f4421e2ad95154431ea1eca38f6ae020"
PARENT=`git log --pretty="format:%H" -n 1`
AUTHOR="n0nakamura <n0nakamura@i6n26.com> 1680522050 +0900"
COMMITTER="n0nakamura <n0nakamura@i6n26.com> 1680522050 +0900"
MESSAGE="$1"
BYTE=`wc -c <<EOS
tree $TREE
parent $PARENT
author $AUTHOR
committer $COMMITTER

$MESSAGE
EOS`

printf "commit $BYTE\0tree $TREE\nparent $PARENT\nauthor $AUTHOR\ncommitter $COMMITTER\n\n$MESSAGE\n" | sha1sum | sed -E 's/ -.*//'
