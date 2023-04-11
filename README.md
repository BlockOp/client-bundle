# Client bundle

This repository contains the Docker Compose configuration for running my Raspberry Pi application, along with an installation and update script.

## Preparing your Raspberry Pi

Before you can run this application on your Raspberry Pi, you'll need to install Docker and Docker Compose. Here's how to do that:

Update your package list:

```shell
sudo apt-get update
```

Install dependencies:

```shell
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
```

Add Docker's GPG key:

```shell
curl -fsSL https://download.docker.com/linux/raspbian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

Add Docker's repository:

```shell
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/raspbian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Install Docker:

```shell
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
```

Add your user to the docker group (replace <your-user> with your Raspberry Pi username):

```shell
sudo usermod -aG docker <your-user>
```

Install Docker Compose:

```shell
sudo apt-get install -y python3-pip libffi-dev
sudo pip3 install docker-compose
```

Reboot your Raspberry Pi for the changes to take effect:

```shell
sudo reboot
```

## Installing and Running the Application

To install and run the application, open a terminal and run the following command:

```shell
curl -sSL https://raw.githubusercontent.com/BlockOp/client-bundle/main/install-update.sh -o install-update.sh && chmod +x install-update.sh && ./install-update.sh
```

This command downloads the install-update.sh script, makes it executable, and runs it. The script will set up your application and configure it to update automatically.