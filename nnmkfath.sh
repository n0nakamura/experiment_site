#!/bin/bash

SOURCE="$1"
TARGET="docs/`basename $1 .adoc`.html"

function error() {
  echo "ERROR: $1"
}

if ! which asciidoctor > /dev/null 2>&1; then
  error "Please install AsciiDoctor"
  exit 1
fi

asciidoctor $SOURCE -o $TARGET && xmllint --encode utf-8 --format $TARGET --output $TARGET
