echo '---------------------Testing the script-----------------------------------'

echo '-----Pinging from SC1 to CS1----------------------------'
sudo docker exec --privileged -it SC1 ping 10.0.2.2 -c 2
echo '-----Pinging from SC1 to CS2----------------------------'
sudo docker exec --privileged -it SC1 ping 10.0.2.3 -c 2
echo '-----Pinging from SC1 to SC2 via GRE tunnel----------------------------'
sudo docker exec --privileged -it SC1 ping 10.10.10.2 -c 2

