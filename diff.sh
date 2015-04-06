#!/bin/sh

cd `dirname $0`

db=$1

for i in `seq 1 12`
do
  query="SELECT word FROM words where level = ${i};"

  inputDir="./pron/"
  outputDir="./pron-sorted/${i}"

  sqlite3 $1 "${query}" | sed -e "s/'/\\\'/g" | while read f; do
    if [ ! -f "${outputDir}/${f}.mp3" ]; then
      echo "Not exists ${f}.mp3! level is ${i}"
    fi
  done
done
