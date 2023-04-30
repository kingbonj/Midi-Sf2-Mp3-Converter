#!/bin/bash

# check if a filename or directory was provided as a command-line argument
if [ -z "$1" ]; then
    echo "Usage: $0 <filename.mid or directory> [soundfont]"
    echo "Available soundfonts:"
    ls /usr/share/sounds/sf2/*.sf2 | xargs -n1 basename
    exit 1
fi

# check if a soundfont file was provided as a command-line argument
if [ ! -z "$2" ]; then
    SOUNDFONT="$2"
fi

# check if the soundfont file exists
if [ ! -f "$SOUNDFONT" ]; then
    echo "Error: $SOUNDFONT not found"
    exit 1
fi

sf2="${SOUNDFONT##*/}"
sf2="${sf2%.*}"

# function to convert a single file
function convert_file {
    input_file="$1"
    output_file="${input_file%.*}-$sf2.mp3"
    fluidsynth -F "$input_file.wav" "$SOUNDFONT" "$input_file"
    lame "$input_file.wav" "$output_file"
    rm "$input_file.wav"
}

# if the command-line argument is a directory, convert all MIDI files within that directory
if [ -d "$1" ]; then
    for file in "$1"/*.mid; do
        if [ -f "$file" ]; then
            convert_file "$file"
        fi
    done
# if the command-line argument is a file, convert only that file
elif [ -f "$1" ]; then
    convert_file "$1"
else
    echo "Error: $1 is not a valid file or directory"
    exit 1
fi
