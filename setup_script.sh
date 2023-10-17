sudo apt update && sudo apt upgrade 
sudo apt-get install ubuntu-restricted-extras -y
sudo apt install vlc -y

sudo apt install gnome-tweak-tool -y
sudo apt-get install tp-smapi-dkms acpi-call-tools tlp tlp-rdw smartmontools ethtool -y

sudo apt-get install network-manager-openconnect-gnome -y
sudo apt-get install openvpn -y

sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
	libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
	libcairo2-dev libx11-dev libxpm-dev libxt-dev -y

sudo apt-get install gimp -y
sudo apt-get install git -y
sudo apt-get install python3-dev -y
sudo apt-get install cmake
sudo apt-get install zathura -y
sudo apt-get install xdotool -y
sudo apt-get install okular -y
sudo apt-get install dconf-editor -y

sudo apt-get install ttf-mscorefonts-installer -y

sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt-get update
sudo apt-get install ibus ibus-bamboo --install-recommends
ibus restart
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"

sudo apt install i3lock
sudo apt install imagemagick
wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system
sudo apt install scrot

sudo apt install oh-my-zsh
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
