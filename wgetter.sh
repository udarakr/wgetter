#!/bin/bash

#execute update script
# ./update.sh

localList="tmp/download.list"
baseDir="/home/udara/pidownloader"

gitrepoName="pidwnlist"
gitDir="$baseDir/$gitrepoName"
wgetterDir="$baseDir/wgetter/"

list="$gitDir/youtube.list"

#cd $baseDir

if [ -f $wgetterDir$localList ]
then
echo "Localcopy exists"
echo "Comparing $list with local $baseDir/$localList"
else
echo "Localcopy not exists in $wgetterDir$localList, Starting a fresh download from $list....."
# read $list
mkdir -p $wgetterDir/tmp
touch $wgetterDir$localList

while read -r line
do
    name="$line"
    echo "Download link read from file - $name"
    echo "$line" >> $wgetterDir$localList
    #success add this to localList
done < "$list"
fi