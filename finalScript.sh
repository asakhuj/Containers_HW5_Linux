echo '---------Checking the dependencies-----------------'
./dependencies.sh
echo '----------Creating the topology--------------------'
./createBridges.sh
echo '----------Attaching the containers-----------------'
./attachContainers.sh
echo '----------Assign IP address-----------------'
./assignIPAddress.sh
echo '----------Creating tunnel -----------------'
./createTunnel.sh


