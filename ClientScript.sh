cd ./Client
docker volume create clientvol
docker build . -t clientscript
docker run --name ClientCont -v clientvol:/clientdata --net MyNet --ip=10.11.0.3 -it clientscript

