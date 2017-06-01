#!/usr/bin/bash

extentions=("png" "jpeg" "jpg" "gif" "bmp")
trueC=1
falseC=0

# If the line below gives you an error, please download cowsay. sudo apt-get install cowsay . Or comment the line instead.
cowsay 'Hello,' "$USER".  $'My name is Cowery. I will be your guide within this program.\n Please enter the size of the image in \"300x400\" format without quotes.\n This will resize all images of format \"png, jpeg, jpg, gif, bmp\" to the size you have entered.\n Make sure you have imagemagick installed. sudo apt-get install imagemagick .'

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

read user_input
IFS=' ' read -r -a new_width_height <<< $user_input

echo ${new_width_height[0]}
echo ${new_width_height[1]}

echo $'\n'"Images resized:"
for file in *
do
  fullfilename=$(basename "$file")
  extention="${fullfilename##*.}"
  filename="${fullfilename%.*}"

  ArrayContains extentions $extention
  if [[ $? == $trueC ]]; then
    new_file_name="$filename-${new_width_height[0]}-${new_width_height[1]}.$extention"
    echo $new_file_name

    convert $fullfilename -resize ${new_width_height[0]}x${new_width_height[1]}\! $new_file_name
    # mv $fullfilename $new_file_name
  fi
done

#END
