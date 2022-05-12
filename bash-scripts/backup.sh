#!/bin/bash

while [ -n "$1" ]
do
	case "$1" in
	-s | --source)
		source="$2"
		shift ;;
	-d | --destination)
		dest="$2"
		shift ;;
	-m | --max-amount)
		max="$2"
		shift ;;
	--) shift
		break ;;
	*) echo "$1 is not an option";;
	esac
	shift
done

if [[ ! -d $source ]]
then
	echo "Source must be directory"
	exit 2
fi

if [[ ! -d $dest ]]
then
	echo "Destination must be directory"
	exit 3
fi

mkdir -p "$dest"

date=$(date +"%F-%H-%M-%S")
archieve="$dest/$date-$(basename "$source").tar"
tar -cvf "$archieve" "$source"
gzip "$archieve"

if [[ -n "$max" ]]; then
	files_cnt=$(ls "$dest" | wc -l)
	if [[ files_cnt > $max ]]; then
		echo "Too mush files"
fi

