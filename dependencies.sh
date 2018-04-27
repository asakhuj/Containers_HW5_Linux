echo "Checking for dependencies..."

#KVM and Libvirt
echo "Installing QEMU VMM:"
sudo apt-get -y install qemu-kvm >&2

echo "Installing libvirt:"
sudo apt-get -y install libvirt-bin >&2
sudo apt-get -y install virt-manager >&2
sudo apt-get -y install virt-viewer >&2
sudo apt-get -y install libguestfs-tools >&2

#sudo apt-get -y install ipcalc

#Python dependencies
apt-get -y install python
apt-get -y install python-pip
pip install --upgrade pip
apt-get -y install python-pexpect
pip install paramiko

#Docker dependencies
sudo apt-get -y update

sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
    
sudo apt-get -y update

sudo apt-get -y install docker-ce

#Pull container image
#docker pull ubuntu
#docker run --privileged ubuntu:latest apt-get update
#docker run --privileged ubuntu:latest apt-get -y install iputils-ping

sudo docker pull ubuntu
sudo docker image ls

echo -e "\nDocker Images:\n"
sudo docker images
