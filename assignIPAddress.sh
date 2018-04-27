sudo docker exec --privileged SC1 apt-get update
sudo docker exec --privileged SC1 apt-get -y --force-yes install iproute2
sudo docker exec --privileged SC1 apt-get -y --force-yes install iputils-ping
#sudo docker exec --privileged SC1 ip addr
sudo docker exec --privileged SC1 ip addr add 10.0.1.1/24 dev vethsc1_1
sudo docker exec --privileged SC1 ip link set vethsc1_1 up
sudo docker exec --privileged SC1 ip addr


#LC1

sudo docker exec --privileged LC1 apt-get update
sudo docker exec --privileged LC1 apt-get -y --force-yes install iproute2
sudo docker exec --privileged LC1 apt-get -y --force-yes install iputils-ping
sudo docker exec --privileged LC1 ip addr
sudo docker exec --privileged LC1 ip addr add 10.0.1.2/24 dev vethlc_1
sudo docker exec --privileged LC1 ip link set vethlc_1 up
sudo docker exec --privileged LC1 ip addr add 10.0.2.1/24 dev eth1
sudo docker exec --privileged LC1 ip link set eth1 up

sudo docker exec --privileged SC1 ip route add 10.0.2.0/24 via 10.0.1.2

echo '---------------LC1 done-------------------------------'

#CS1
sudo docker exec --privileged CS1 apt-get update
sudo docker exec --privileged CS1 apt-get -y --force-yes install iproute2
sudo docker exec --privileged CS1 apt-get -y --force-yes install iputils-ping
sudo docker exec --privileged CS1 ip addr

sudo docker exec --privileged CS1 ip addr add 10.0.2.2/24 dev eth0
sudo docker exec --privileged CS1 ip link set eth0 up
sudo docker exec --privileged CS1 ip route add 10.0.1.0/24 via 10.0.2.1

echo '------------------CS1 done--------------------------'

#CS2
sudo docker exec --privileged CS2 apt-get update
sudo docker exec --privileged CS2 apt-get -y --force-yes install iproute2
sudo docker exec --privileged CS2 apt-get -y --force-yes install iputils-ping
sudo docker exec --privileged CS2 ip addr

sudo docker exec --privileged CS2 ip addr add 10.0.2.3/24 dev eth0
sudo docker exec --privileged CS2 ip link set eth0 up
sudo docker exec --privileged CS2 ip route add 10.0.1.0/24 via 10.0.2.1


######Right side of topology

echo '------Assigning ip address to right side of toplogy----------'
sudo docker exec --privileged SC2 apt-get update
sudo docker exec --privileged SC2 apt-get -y --force-yes install iproute2
sudo docker exec --privileged SC2 apt-get -y --force-yes install iputils-ping
sudo docker exec --privileged SC2 ip addr add 10.0.3.1/24 dev vethsc2_1
sudo docker exec --privileged SC2 ip link set vethsc2_1 up
sudo docker exec --privileged SC2 ip addr


#LC2

sudo docker exec --privileged LC2 apt-get update
sudo docker exec --privileged LC2 apt-get -y --force-yes install iproute2
sudo docker exec --privileged LC2 apt-get -y --force-yes install iputils-ping
sudo docker exec --privileged LC2 ip addr
sudo docker exec --privileged LC2 ip addr add 10.0.3.2/24 dev vethlc2_1
sudo docker exec --privileged LC2 ip link set vethlc2_1 up
sudo docker exec --privileged LC2 ip addr add 10.0.4.1/24 dev eth1
sudo docker exec --privileged LC2 ip link set eth1 up

sudo docker exec --privileged SC2 ip route add 10.0.4.0/24 via 10.0.3.2

echo '---------------LC2 done-------------------------------'

#CS3
sudo docker exec --privileged CS3 apt-get update
sudo docker exec --privileged CS3 apt-get -y --force-yes install iproute2
sudo docker exec --privileged CS3 apt-get -y --force-yes install iputils-ping
sudo docker exec --privileged CS3 ip addr

sudo docker exec --privileged CS3 ip addr add 10.0.4.2/24 dev eth0
sudo docker exec --privileged CS3 ip link set eth0 up
sudo docker exec --privileged CS3 ip route add 10.0.3.0/24 via 10.0.4.1

echo '------------------CS3 done--------------------------'

#CS4
sudo docker exec --privileged CS4 apt-get update
sudo docker exec --privileged CS4 apt-get -y --force-yes install iproute2
sudo docker exec --privileged CS4 apt-get -y --force-yes install iputils-ping
sudo docker exec --privileged CS4 ip addr

sudo docker exec --privileged CS4 ip addr add 10.0.4.3/24 dev eth0
sudo docker exec --privileged CS4 ip link set eth0 up
sudo docker exec --privileged CS4 ip route add 10.0.3.0/24 via 10.0.4.1


#Assign IP address to secondary interfaces

echo '----------Secondary interfaces--------------'

sudo docker exec --privileged SC1 ip addr add 10.0.5.1/24 dev vethsc1_2
sudo docker exec --privileged SC1 ip link set vethsc1_2 up
sudo docker exec --privileged LC2 ip addr add 10.0.5.1/24 dev vethlc2_2
sudo docker exec --privileged LC2 ip link set vethlc2_2 up

sudo docker exec --privileged SC2 ip addr add 10.0.7.1/24 dev vethsc2_2
sudo docker exec --privileged SC2 ip link set vethsc2_2 up
sudo docker exec --privileged LC1 ip addr add 10.0.7.2/24 dev vethlc_2
sudo docker exec --privileged LC1 ip link set vethlc_2 up


sudo docker exec --privileged SC1 ip route add 10.0.7.0/24 via 10.0.1.2
sudo docker exec --privileged SC2 ip route add 10.0.1.0/24 via 10.0.7.2
#sudo docker exec --privileged SC1 ip route add 10.0.2.0/24 via 10.0.1.2

