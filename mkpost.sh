#!/bin/bash

if [[ -z $1 ]]; then
  echo "Usage: ./mkpost <title> [<content>]"
  exit 0
else
  title=$1
fi

file=$title.md

if [ -f $file ]; then
  echo "'$file' already exists. Please choose another title."
  exit 0
fi

now=`date '+%Y-%m-%d %H:%M'`

if [[ $2 ]]; then
  content=${*:2}
fi

cat  << EOF > $file
Title: $title
Slub: $title
Date: $now

$content
EOF

vi $file

