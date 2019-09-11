FROM ubuntu
RUN apt-get -y update
RUN apt-get -y install openssh-server 
RUN apt-get -y install iputils-ping
RUN apt-get -y install nano

RUN mkdir /root/.ssh
COPY ./authorized_keys /root/.ssh

RUN mkdir /serverdata
COPY ./FileServer2.sh /serverdata
WORKDIR /serverdata
CMD sh /serverdata/FileServer2.sh


