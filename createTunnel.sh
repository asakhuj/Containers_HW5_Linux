sudo docker exec --privileged -it SC1 ip tunnel add gre2 mode gre local 10.0.1.1 remote 10.0.7.1
sudo docker exec --privileged -it SC1 ip link set gre2 up
sudo docker exec --privileged -it SC1 ip addr add 10.10.10.1/24 dev gre2
sudo docker exec --privileged -it SC2 ip tunnel add gre2 mode gre local 10.0.7.1 remote 10.0.1.1
sudo docker exec --privileged -it SC2 ip link set gre2 up
sudo docker exec --privileged -it SC2 ip addr add 10.10.10.2/24 dev gre2
