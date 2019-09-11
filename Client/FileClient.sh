#sshpass -p "password" ssh -o StrictHostKeyChecking=no server@10.11.0.2
#scp ServerCont@10.11.0.2:/serverdata/RandomFile.txt /clientdata
#scp ServerCont@10.11.0.2:/serverdata/chksumFile /clientdata
#docker exec -i ClientCont sh -c 'cat > /clientdata/' < /home/FileFromServer/*
service ssh start

scp -o "StrictHostKeyChecking no" root@10.11.0.2:/serverdata/RandomFile.txt /clientdata
scp -o "StrictHostKeyChecking no" root@10.11.0.2:/serverdata/chksumFile /clientdata

a=$(cat chksumFile)
b=$(sha256sum  RandomFile.txt)

if [ "$a" = "$b" ]
then
	echo "Correct File Recieved From Server"
else
	echo "Wrong File"
	rm -f RandomFile.txt chksumFile
fi

sh
