#!/bin/sh

echo "Some Random Text" > RandomFile.txt
truncate -s 1k RandomFile.txt
sha256sum  RandomFile.txt > chksumFile
echo "Files Generated on Server"

service ssh start

sh


#adduser --disabled-password --gecos "" server
#echo server:password | chpasswd

#cd /home && mkdir FileFromServer
#docker cp ServerCont:/serverdata/RandomFile.txt ServerCont:/serverdata/chksumFile /home/FileFromServer

