#!/bin/bash
for file in *.cue *.bin *.chd *.m3u
do
	if [ -f "$file" ]; then
		dir_name=$(expr "$file" : '\(.*\)\.cue$' \| \
			"$file" : '\(.*\)\.bin$' \| \
			"$file" : '\(.*\)\.chd$' \| \
			"$file" : '\(.*\)\.m3u$' \| "$file")
		dir_name_no_disc_track_rev=$(expr "$dir_name" : '\(.*\) (D.*$' \| \
			"$dir_name" : '\(.*\) (T.*$' \| \
			"$dir_name" : '\(.*\) (R.*$' \| "$dir_name")
		mkdir "$dir_name_no_disc_track_rev"
		mv "$file" "$dir_name_no_disc_track_rev"
	fi
done
