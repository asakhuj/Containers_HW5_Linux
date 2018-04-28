echo '---------Checking the dependencies-----------------'
chmod +x dependencies.sh
./dependencies.sh
echo '----------Creating the topology--------------------'
chmod +x createBridges.sh
./createBridges.sh
echo '----------Attaching the containers-----------------'
chmod +x attachContainers.sh
./attachContainers.sh
echo '----------Assign IP address-----------------'
chmod +x assignIPAddress.sh
./assignIPAddress.sh
echo '----------Creating tunnel -----------------'
chmod +x createTunnel.sh
./createTunnel.sh
echo '----------TESTBED -----------------'
chmod +x testScript.sh
./testScript.sh


