#https://www.youtube.com/watch?v=7mOGWL6wnss

###
#Step 1
sudo apt-update && apt-upgrade
curl -fsSL get.docker.com | sh
apt install \
apparmor \
bluez \
cifs-utils \
curl \
dbus \
iproute2 \
jq \
libglib2.0-bin \
lsb-release \
network-manager \
nfs-common \
systemd-journal-remote \
systemd-resolved \
systemd-timesyncd \
udisks2 \
wget -y
###

###
#Step 2
cd /tmp
wget https://github.com/home-assistant/os-agent/releases/download/1.7.2/os-agent_1.7.2_linux_aarch64.deb
chmod +x os-agent_1.7.2_linux_aarch64.deb
sudo dpkg -i os-agent_1.7.2_linux_aarch64.deb
###

###
#Step 3
wget -O homeassistant-supervised.deb https://github.com/home-assistant/supervised-installer/releases/latest/download/homeassistant-supervised.deb
apt install ./homeassistant-supervised.deb
chmod +x homeassistant-supervised.deb
apt install ./homeassistant-supervised.deb
###

#Wait for HomeAssistant to come online, check at IPADDRESS:8321
#SSH back into OrangePiZero3 and issue command `sudo reboot now`
#Wait for HomeAssistant to come back online. Create account for H.A at IPADDRESS:8321.