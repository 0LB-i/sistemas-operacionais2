#!/bin/bash
## Instalação do OpenSSH

sudo apt update 
sudo apt upgrade -y
sudo apt install openssh-server -y

## Ajuste deo time zone

sudo dpkg-reconfigure tzdata

