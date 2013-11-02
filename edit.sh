#!/bin/bash

script=`basename $0`

if [[ -z $1 ]]; then
  echo "Usage: $script <title> [<content>]"
  echo "Example: $script hello \"This is my fist post!\""
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
  content=$2 
  #] or everything starting from the second argument: ${*:2}
fi

cat  << EOF > $file
Title: $title
Slub: $title
Date: $now

$content
EOF

#[ open $file in user's default editor, if none found, use vi
"${EDITOR:-vi}" $file 
