# Docker
sudo apt-get update
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
sudo curl -LR https://download.docker.com/linux/debian/gpg -o /etc/apt/trusted.gpg.d/docker.gpg.asc
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce -y
docker --version

# Docker-compose
sudo apt update -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Test if docker is working
sudo docker run hello-world
