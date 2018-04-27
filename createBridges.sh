#Create containers with default bridge
sudo docker run --name SC1 -itd ubuntu
#sudo docker attach SC1
echo '---------SC1 created--------------'
sudo docker run --name LC1 -itd ubuntu
#sudo docker attach LC1
echo '---------LC1 created--------------'


#Create new bridge network
sudo docker network create -d bridge bridge1
sudo docker network create -d bridge bridge2

#Create LC1 , CS1 , CS2 with bridge 1 :
sudo docker run -d --name CS1 --network bridge1 -itd ubuntu
#sudo docker attach CS1
echo '---------CS1 created--------------'
sudo docker run -d --name CS2 --network bridge1 -itd ubuntu
#sudo docker attach CS2
echo '---------CS2 created--------------'
#Attach LC1 to bridge1
sudo docker network connect bridge1 LC1

#Attach CS1 , CS2 to default network
sudo docker network connect bridge CS1
sudo docker network connect bridge CS2

echo '-----------------Containers created---------------------' 
sudo docker ps
echo '---------------Container bridges-------------------'
sudo docker network ls
