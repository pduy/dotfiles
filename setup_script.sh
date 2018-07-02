sudo apt update && sudo apt upgrade 
sudo apt-get install ubuntu-restricted-extras -y
sudo apt install vlc -y
# 1. Add the Spotify repository signing keys to be able to verify downloaded packages -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list 

# 3. Update list of available packages
sudo apt-get update 

# 4. Install Spotify
sudo apt-get install spotify-client -y

sudo apt install gnome-tweak-tool -y
sudo apt-get install tp-smapi-dkms acpi-call-tools tlp tlp-rdw smartmontools ethtool -y
sudo tlp start 

sudo apt-get install powertop -y
sudo apt-get install cpufrequtils -y

sudo apt-get install bumblebee bumblebee-nvidia primus linux-headers-generic -y
sudo apt-get purge nvidia* -y
sudo apt-get install indicator-cpufreq -y

echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA -y
sudo apt-get update -y
sudo apt-get install cassandra -y
sudo update-rc.d cassandra disable 
sudo apt-get install network-manager-openconnect-gnome -y
sudo apt-get install openvpn -y
sudo apt-get install fcitx fcitx-unikey -y

sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
	libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
	libcairo2-dev libx11-dev libxpm-dev libxt-dev -y

sudo apt-get install gimp -y
sudo apt-get install git -y
sudo apt-get install python-dev -y
sudo apt-get install python3-dev -y
sudo apt-get install cmake
sudo apt-get install zathura -y
sudo apt-get install texlive-full -y
sudo apt-get install xdotool -y
sudo apt-get install okular -y
sudo apt-get install dconf-editor -y

sudo apt-get install ttf-mscorefonts-installer -y
