#Create veth pair 
sudo ip link add vethsc1_1 type veth peer name vethlc_1
sc1=$(sudo docker inspect -f {{.State.Pid}} SC1)
echo '---------------------'
lc1=$(sudo docker inspect -f {{.State.Pid}} LC1)
echo '-------------1st--------------'
echo $sc1
echo '----------2nd--------------'
echo $lc1
sudo ip link set dev vethsc1_1 netns $sc1
sudo ip link set dev vethlc_1 netns $lc1
