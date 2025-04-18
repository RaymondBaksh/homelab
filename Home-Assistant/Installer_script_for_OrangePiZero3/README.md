# Home Assistant Supervised on Orange Pi Zero 3

This repository provides a guide and commands for installing Home Assistant Supervised on an Orange Pi Zero 3 running Orange Pi OS 1.0.4 Bookworm.

**Note:** Home Assistant Supervised requires a specific set of dependencies and a compliant operating system environment. Home Assistant should be installed on a clean build of Debian.

## Table of Contents

- [About](#about)
- [Prerequisites](#prerequisites)
- [Important Considerations](#important-considerations)
- [Installation](#installation)
- [Accessing Home Assistant](#accessing-home-assistant)

## About

This guide details the steps required to install Home Assistant Supervised on an Orange Pi Zero 3 running Orange Pi OS 1.0.4 Bookworm (based on Debian 12).

## Prerequisites

Before you begin, ensure you have the following:

* **[Orange Pi Zero 3 board](http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-Zero-3.html):** 
* **SD card:** 32GB or larger is recommended.
* **[Orange Pi OS 1.0.4 Bookworm](https://drive.google.com/drive/folders/10zlO-0mMz-fqRQOKAOWX-mQA_UbN_C1n):** Installed and running on your Orange Pi Zero 3. This guide assumes you are using this specific OS version.
* **Network connectivity:** Initial setup is recommeneded over ethernet connection.
* **SSH access:** To connect to your Orange Pi Zero 3 terminal.
* **User with sudo privileges:** You will executing commands as the root user.

## Important Considerations

* **Supported Operating System:** While this guide provides steps for H.A setup on Orange Pi Zero 3, the officially supported operating system for Home Assistant Supervised is **Debian**, specifically the latest 64-bit version. Using other distributions or modified versions like OPiZero3 will work, it is not officially supported and could lead to unexpected issues or lack of support from the Home Assistant community if problems arise.
* **Host System Management:** With the H.A Supervised installation, YOU are responsible for managing the host operating system (OPi3Zero) and performing any updates.
* **Resource Usage:** It is recommended that your Orange Pi Zero 3 has a minimum of 3GBs of RAM

## Installation

Follow these steps carefully to install Home Assistant Supervised.

1.  **Connect and SSH into your Orange Pi Zero 3:**

    ```bash
    ssh root@your_orange_pi_ip
    ```

2.  **Update the system:**
    Check for updates before starting the install.

    ```bash
    sudo apt update
    sudo apt upgrade -y
    ```
    Reboot after updates are completed.

    ```bash
    sudo reboot
    ```
    SSH back into your OPiZero3 when it is back online.

3.  **Install Dependencies:**
    Run the following to install dependencies for H.A

    ```bash
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
    ```

4.  **Verify Docker Install:**
    Docker should already be installed from the OrangePi image file
    
    Verify Docker is running:

    ```bash
    sudo systemctl status docker
    ```
    Add your user to the `docker` group to run Docker commands without `sudo` (you'll need to log out and back in for this to take effect):

    ```bash
    sudo usermod -aG docker $USER
    ```

5.  **Install OS-Agent:**
    Download and install the latest `os-agent` deb package suitable for your architecture (arm64). You can find the latest release on the [Home Assistant OS Agent GitHub releases page](https://github.com/home-assistant/os-agent/releases/download).

    ```bash
    # Find the latest version and replace the URL
    # wget [https://github.com/home-assistant/os-agent/releases/download/VERSION/os-agent_VERSION_linux_aarch64.deb](https://github.com/home-assistant/os-agent/releases/download/VERSION/os-agent_VERSION_linux_aarch64.deb)
    # sudo dpkg -i os-agent_VERSION_linux_aarch64.deb
    
    cd /tmp
    wget https://github.com/home-assistant/os-agent/releases/download/1.7.2/os-agent_1.7.2_linux_aarch64.deb
    chmod +x os-agent_1.7.2_linux_aarch64.deb
    sudo dpkg -i os-agent_1.7.2_linux_aarch64.deb
    ```

    Verify the OS-Agent service is running:

    ```bash
    systemctl status os-agent
    ```

6.  **Install Home Assistant Supervised:**
    Run each command one at a time

    ```bash
    wget -O homeassistant-supervised.deb https://github.com/home-assistant/supervised-installer/releases/latest/download/homeassistant-supervised.deb
    apt install ./homeassistant-supervised.deb
    chmod +x homeassistant-supervised.deb
    apt install ./homeassistant-supervised.deb
    ```
    The script will prompt you for your system architecture, select `qemuarm64`.


7.  **Verify Installation:**
    Check the status of the Home Assistant Supervisor service.

    ```bash
    sudo docker ps
    ```
    You should see containers for `hassio-supervisor`, `hassio_observer`, and `homeassistant` running.

    Once the installation is complete and the containers are running, Home Assistant should be accessible via your web browser. 

    Open a browser and navigate to `IPADDRESS:8321`. You may see that Home Assistant is still installing a few more things before you can create an account. When you can, create an account and then log out.

    Return to your terminal and SSH back into your OrangePiZERO3. Issue the command `sudo reboot now`, to have the SBC reboot and enable Home Assistant to start in Supervised mode. 

## Accessing Home Assistant

    Open a browser and navigate to `IPADDRESS:8321`, login and start usinng Home Assistant.