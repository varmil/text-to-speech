#!/bin/sh

cd `dirname $0`

db=$1

for i in `seq 1 12`
do
  query="SELECT word FROM words where level = ${i};"

  inputDir="./pron/"
  outputDir="./pron-sorted/${i}"

  mkdir -p ${outputDir}

  sqlite3 $1 "${query}" | sed -e "s/'/\\\'/g" | xargs -P8 -I{} find ${inputDir} -name "{}.mp3" | sed -e "s/'/\\\'/g" | xargs -P8 -I% mv % ${outputDir}
done
