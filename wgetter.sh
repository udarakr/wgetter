#!/bin/bash

#execute update script
# ./update.sh

localList="tmp/download.list"
baseDir="/home/udara/pidownloader"

gitrepoName="pidwnlist"
gitDir="$baseDir/$gitrepoName"
wgetterDir="$baseDir/wgetter/"

list="$gitDir/youtube.list"

if [ -f $wgetterDir$localList ]
then
echo "Localcopy exists"
echo "Comparing $list with local $wgetterDir$localList"
#grep -Fxvf $wgetterDir$localList $list
while read -r line ; do
    echo "Reading new download link - $line"
    # youtube-dl $link
    #if link contains "youtube" use youtube-dl else use wget
    if [[ $line == https://www.youtube.com/* ]]
	then
		echo "Initializing download from youtube-dl..."
	    # youtube-dl $link
	else
		echo "Initializing download from wget..."
		# wget $link
	fi
    echo "$line" >> $wgetterDir$localList
done < <(grep -Fxvf $wgetterDir$localList $list)
else
echo "Localcopy not exists in $wgetterDir$localList, Starting a fresh download from $list....."
# read $list
mkdir -p $wgetterDir/tmp
touch $wgetterDir$localList

while read -r line
do
    echo "Download link read from file - $line"
    # youtube-dl $link
    #if link contains "youtube" use youtube-dl else use wget
    if [[ $line == https://www.youtube.com/* ]]
	then
		echo "Initializing download from youtube-dl..."
	    # youtube-dl $link
	else
		echo "Initializing download from wget..."
		# wget $link
	fi
    echo "$line" >> $wgetterDir$localList
done < "$list"
fi