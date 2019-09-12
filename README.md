# assignment2
I have created a automation script for creating two docker containers(Server & Client) and communication between them using shell scripting

There are 2 shell scripting files for this (ServerScript.sh & ClientScript.sh)

First We Run ServerScript.sh

step 1 : Creates a volume named "servervol"
step 2 : The server container mounts "servervol" in "/serverdata".
step 3 : Creates a bridge network named "MyNet" with subnet "10.11.0.0/12"
step 4 : builds an image serverscript
step 5 : runs the container named "ServerCont" on ip "10.11.0.2" and network "MyNet" on volume "servervol"


Thus, the ServerScript.sh creates a volume, network, builds the image and runs the container.
When we run this container:

Step 1 : It creates 2 files on /serverdata named "RandomFile.txt" and "chksumFile"
Step 2 : The RandomFile.txt contains some random text with size of 1kb
step 3 : The chksumFile contains the checksum of file RandomFile.txt using sha256sum


Now we Run ClientScript.sh

step 1 : Creates a volume named "clientvol" 
step 2 : The client container mounts "clientvol" in "/clientdata". 
step 3 : builds an image clientscript
step 4 : runs the container named "ClientCont" on ip "10.11.0.3" and network "MyNet" on volume "clientvol"

Thus, the ClientScript.sh creates a volume, network, builds the image and runs the container.
When we run this container:

Step 1 : Recevies files from the Server Container using scp
Step 2 : It checks for the checksum of the RandomFile.txt
step 3 : If the checksum matches it displays "correct file received from server" message
step 4 : If not then :
			      i) It first displays a "Wrong File" message
		       ii) Then removes the files received  


Note : Both the containers must be running, to communicate with each other.

Note2 : 1) Here I have used scp method to transfer the files between the container, there are also other ways of doing it.
	      2) Other ways include : Volume mount, In this the files could be stored on docker volume and the same volume could be          
                                shared by both the containers.
	        There are 3 ways of doing it :
		          i)Using Volumes : In this the files are stored on the host in a place which is managed by the docker and no user 
                                without the permissions can access it.  	
	           ii)Using Bind Mount : In this the files are stored on the host anywhere where the user wants and any user without 
                                   the permissions can access it.
	          iii)Using tmpfs Mount : In this the files are stored on the host's memory only. A tmpfs mount is not persisted.
