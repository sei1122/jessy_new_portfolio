#! /bin/bash
set -x

# install golang
sudo apt update
wget https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.3.linux-amd64.tar.gz
sudo echo "export GOPATH=\$HOME/go" > ~/.profile
sudo echo "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin:~/bin/"  >> ~/.profile
sudo echo "export GOBIN=\$GOPATH/bin" >> ~/.profile
source ~/.profile
mkdir -p ~/go/{bin,src,pkg}
mkdir -p ~/log
mkdir -p ~/bin
go version

# uninstall apache2 
sudo service apache2 stop
sudo apt-get purge apache2 apache2-utils apache2.2-bin apache2-common
# or 
sudo apt-get purge apache2 apache2-utils apache2-bin apache2.2-common
sudo apt-get autoremove -y
which apache2
# sudo service apache2 start

# install unzip tools
sudo apt install -y unzip

# install rsync
sudo apt-get install rsync

# install git
sudo apt install git-all

# include killall
sudo apt-get install psmisc

# clone website from git
sudo killall jessy_new_portfolio
ps -aux
rm -rf jessy_new_portfolio
git clone https://github.com/sei1122/jessy_new_portfolio
cd jessy_new_portfolio
go mod init github.com/sei1122/jessy_new_portfolio
go mod tidy
go build

# get ssl for https (has user input?) 
sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot certonly --standalone -d jessyjin.com -d www.jessyjin.com
# Certificate is saved at: /etc/letsencrypt/live/jessyjin.com/fullchain.pem
# Key is saved at:         /etc/letsencrypt/live/jessyjin.com/privkey.pem

# run the server in the background
nohup sudo PORT=80 PROJECT_ID=817745931695 ./jessy_new_portfolio &

set +x