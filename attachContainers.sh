#Create veth pair 
sudo ip link add vethsc1_1 type veth peer name vethlc_1
sudo ip link add vethsc1_2 type veth peer name vethlc2_2
sudo ip link add vethsc2_1 type veth peer name vethlc2_1
sudo ip link add vethsc2_2 type veth peer name vethlc_2

echo '---------------------'
sc1=$(sudo docker inspect -f {{.State.Pid}} SC1)
echo '---------------------'
lc1=$(sudo docker inspect -f {{.State.Pid}} LC1)
echo '---------------------'
sc2=$(sudo docker inspect -f {{.State.Pid}} SC2)
echo '---------------------'
lc2=$(sudo docker inspect -f {{.State.Pid}} LC2)
echo '---------------------'

sudo ip link set dev vethsc1_1 netns $sc1
sudo ip link set dev vethlc_1 netns $lc1

sudo ip link set dev vethsc2_1 netns $sc2
sudo ip link set dev vethlc2_1 netns $lc2

sudo ip link set dev vethsc1_2 netns $sc1
sudo ip link set dev vethlc2_2 netns $lc2

sudo ip link set dev vethsc2_2 netns $sc2
sudo ip link set dev vethlc_2 netns $lc1

