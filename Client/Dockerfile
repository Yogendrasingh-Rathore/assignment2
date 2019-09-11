FROM ubuntu
RUN apt-get -y update
RUN apt-get -y install openssh-server
RUN apt-get -y install openssh-client 
RUN apt-get -y install sshpass

RUN mkdir /root/.ssh
COPY ./id_rsa /root/.ssh
COPY ./authorized_keys /root/.ssh

RUN mkdir /clientdata
COPY ./FileClient.sh /clientdata
WORKDIR /clientdata


CMD sh /clientdata/FileClient.sh
