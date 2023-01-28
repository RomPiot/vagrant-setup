# Exit on error
set -e

# Update and upgrade
sudo apt-get update -y
# sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common tree debian-keyring debian-archive-keyring -y

# Install and configure git
if [ -f "/home/$(whoami)/.gitconfig" ]; then
    echo "File ~/.gitconfig exists."
else
    sudo apt install git -y
    sudo apt-get install git-flow -y

    # touch ~/.gitconfig

    # echo "Please enter your git global email:"
    # read git_email
    # echo "Please enter your git global name:"
    # read git_name

    # git config --global user.name "$git_email"
    # git config --global user.email "$git_name"

    # touch ~/.gitignore_aliases

    # # add alias.co checkout to ~/.gitignore_aliases
    # echo "alias.co=checkout" >>~/.gitignore_aliases
    # echo "alias.br=branch" >>~/.gitignore_aliases
    # echo "alias.com=commit" >>~/.gitignore_aliases
    # echo "alias.st=status" >>~/.gitignore_aliases
    # echo "alias.last='log -1 HEAD'" >>~/.gitignore_aliases
    # echo "alias.lg='log --oneline'" >>~/.gitignore_aliases
    # echo "alias.ada='add -A'" >>~/.gitignore_aliases
    # echo "alias.amend='commit --amend --no-edit'" >>~/.gitignore_aliases
fi

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

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Test if docker is working
sudo docker run hello-world

# Caddy
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt-get update -y
sudo apt install caddy
