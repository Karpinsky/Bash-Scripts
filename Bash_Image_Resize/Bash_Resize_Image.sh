#!/usr/bin/bash

extentions=("png" "jpeg" "jpg" "gif")
trueC=1
falseC=0

function ArrayContains {
  local array="$1[@]"
  local seeking="$2"
  for element in "${!array}"; do
    if [[ $element == $seeking ]]; then
      return 1
    fi
  done
  return 0
}

for file in *
do
  ArrayContains extentions "${file##*.}"
  if [[ $? == $trueC ]]; then
    echo "cool"
  fi
done
