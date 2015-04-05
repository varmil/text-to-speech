#!/bin/sh

db=$1
query="SELECT word FROM words;"

saveDir="./pron/"

mkdir -p ${saveDir}

sqlite3 $1 "${query}" | sed -e "s/'/\\\'/g" | xargs -P4 -I% wget -U Mozilla -nv --wait=1 --waitretry=3 --tries=3 -O "${saveDir}%.mp3" "http://translate.google.com/translate_tts?tl=en&q=%"
