# Exit on error
set -e

# Update and upgrade
sudo apt-get update -y
# sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common tree -y

# Install and configure git
if [ -f "/home/$(whoami)/.gitconfig" ]; then
    echo "File ~/.gitconfig exists."
else
    cat ~/.ssh/id_rsa.pub
    read -p "
    You must now paste displayed output on your repository account in SSH key configuration section, with appropriate label.
    Press a key to continue..."
    sudo apt install git -y
    read -p "Enter git name: `echo $'\n> '`" GIT_USER && git config --global user.name $GIT_USER
    read -p "Enter git email: `echo $'\n> '`" GIT_EMAIL && git config --global user.email $GIT_EMAIL
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.com commit
    git config --global alias.st status
    git config --global alias.last 'log -1 HEAD'
    git config --global alias.lg 'log --oneline'
    git config --global alias.ada 'add -A'
    git config --global alias.amend 'commit --amend --no-edit'

    sudo apt-get install git-flow -y
fi

# # Add host names
# echo "127.0.0.1    test.local" | sudo tee -a /etc/hosts

# Docker
sudo apt remove docker-ce
sudo curl -LR https://download.docker.com/linux/debian/gpg -o /etc/apt/trusted.gpg.d/docker.gpg.asc
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update -yq
apt-cache policy docker-ce
sudo apt install docker-ce -y
docker --version
sudo usermod -aG docker $(whoami)

# Docker-compose
sudo apt update -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin  -y

# Test if docker is working
sudo docker run hello-world
