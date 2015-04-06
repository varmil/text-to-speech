#!/bin/sh

wget -U Mozilla -nv -O "${1}.mp3" "http://translate.google.com/translate_tts?tl=en&q=${1}"
