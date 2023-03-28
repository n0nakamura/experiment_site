#!/bin/bash

SOURCE="./docs/01GSH7D013HQPGGT11GD277EN2.svg"
OUTPUT="./docs/01GWMB6HXB91MX4FCZ2B83D2NP.ico"

function error() {
  echo "ERROR: $1"
}

if ! which convert > /dev/null 2>&1; then
  error "Please install ImageMagic"
  exit 1
fi

convert $SOURCE -define "icon:auto-resize=256,196,192,160,152,150,144,128,120,114,96,76,72,70,64,60,57,48,40,32,24,16" $OUTPUT
