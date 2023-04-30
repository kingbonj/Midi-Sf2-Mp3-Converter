# Midi-Sf2-Mp3-Converter
This is a simple Bash script that converts MIDI files to MP3 using the FluidSynth and LAME command-line utilities. The script can convert a single MIDI file or all MIDI files in a directory, and can use a specified soundfont file for improved sound quality.

## Prerequisites
To use this script, you will need to have the following software installed:

```
FluidSynth
LAME
```

If you plan to use a soundfont file, you will also need a compatible soundfont file in the SF2 format.

## Usage
Running the script without parameters will display usage and list files found in `/usr/share/sounds/sf2/*.sf2` which you can pass as input parameters.

To convert **a single MIDI** file to MP3, run the script with the path to the MIDI file as the first argument:

`./midi-to-mp3.sh [path/to/file.mid]`

To convert **all MIDI files in a directory**, run the script with the path to the directory as the first argument:

`./midi-to-mp3.sh [path/to/directory]`

To **specify a soundfont** file for improved sound quality, provide the path to the soundfont file as the second argument:

`./midi-to-mp3.sh [path/to/file.mid] [path/to/soundfont.sf2]`

If no soundfont file is specified, the script will use the default FluidSynth soundfont.

## Output
The script will create an MP3 file for each input MIDI file, with the same name as the input file but with the soundfont label and .mp3 extension. 
The output file will be placed in the same directory as the input file.

## License
This script is licensed under the GPL License. See the LICENSE file for details.

## Acknowledgments
The FluidSynth and LAME utilities are developed by the open source community and are distributed under the LGPL and GPL licenses, respectively.
