#!/bin/bash
echo "Downloading ngrok..."
case `dpkg --print-architecture` in
    aarch64)
    architectureURL="arm64" ;;
    arm)
    architectureURL="arm" ;;
    armhf)
    architectureURL="arm" ;;
    amd64)
    architectureURL="amd64" ;;
    i*86)
    architectureURL="386" ;;
    x86_64)
    architectureURL="amd64" ;;
    *)
        echo "unknown or unsupported architecture"
esac

wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-${architectureURL}.tgz -O ~/ngrok.tgz
# arm : https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.tgz
# aarch46 : https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.tgz
# i368 : https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.tgz
# x86_64 : https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
tar -xf ngrok.tgz
rm "$PREFIX/bin/ngrok"
mv ngrok "$PREFIX/bin"
rm ngrok.tgz
echo -e "\e[1;32mNgrok up-to-date!\e[0m"
