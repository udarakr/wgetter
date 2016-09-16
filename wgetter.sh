#!/bin/bash

#execute update script
# ./update.sh

localList="tmp/download.list"
baseDir="/home/udara/pidownloader/"

gitrepoName="pidwnlist"
gitDir="$baseDir$gitrepoName"
wgetterDir="$baseDir/wgetter/"

list="$gitDir/youtube.list"

cd $baseDir

if [ -d $wgetterDir$localList ]
then
echo "Localcopy exists"
echo "Comparing $list with local $baseDir$localList"
else
echo "Localcopy not exists, Starting a fresh download from $list....."
# read $list

while read -r line
do
    name="$line"
    echo "Download link read from file - $name"
done < "$list"
fi