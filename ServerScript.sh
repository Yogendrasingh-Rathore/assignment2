cd ./Server
#docker volume create servervol
#docker network create -d bridge MyNet --subnet="10.11.0.0/12"
docker build . -t serverscript
docker run --name ServerCont -v servervol:/serverdata --net MyNet --ip=10.11.0.2 -it serverscript 







