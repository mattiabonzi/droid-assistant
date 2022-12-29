#!/usr/bin/env bash
echo "Init"
clear
echo "This is just an installer! \nRefer to the documentation of the single sofwtare for any doubt"
echo "Script write with <3 by:"
echo "   ______           __  "
echo "  /_  __/_  _______/ /_ "
echo "   / / / / / / ___/ __ \ "
echo "  / / / /_/ / /__  / / / "
echo " /_/  \__,_/\___/_/ /_/ "
echo "Be sure that you are connected to internet, and taht you're running Android > 6 (api 24)\nFor more info please visit: "
echo "Update repo"
pkg update -y
echo "Ask for storage permissionss"
termux-setup-storage
echo "Install dependencies"
pkg install -y openssh
echo -e "android\nandroid" | passwd
sshd
#echo y | pkg install -y libffi
echo y | pkg install -y openssl
echo y | pkg install -y coreutils
echo y | pkg install -y nano
echo y | pkg install -y mosquitto
echo y | pkg install -y nodejs
echo y | pkg install -y openssh
echo y | pkg install -y termux-api
echo y | pkg install -y make
echo y | pkg install -y curl
echo y | pkg install -y libjpeg-turbo
echo y | pkg install -y binutils
echo y | pkg install -y ndk-sysroot
echo y | pkg install -y build-essential
echo y | pip install netdisco
echo "Install pm2 and node-red"
npm i -g --unsafe-perm node-red
npm i -g --unsafe-perm pm2 
echo "Start mosquitto" 
pm2 start mosquitto -- -v -c /data/data/com.termux/files/usr/etc/mosquitto/mosquitto.conf
echo "Start node-red"
pm2 start node-red
echo "Save pm2 config"
pm2 save 
echo "Add pm2 resurrect to bashrc file"
#TODO

echo -e "\n\n\a\a\aDone\n\nScript write with <3 by:";
echo -e "   ______           __  "
echo -e "  /_  __/_  _______/ /_ "
echo -e "   / / / / / / ___/ __ \ "
echo -e "  / / / /_/ / /__  / / / "
echo -e " /_/  \__,_/\___/_/ /_/ \n"
echo -e "Use Username: 'admin' and Password: 'android' to connect to the device via ssh on local network (port 8022)\n
To check your ip (may vary) go to (on your phone): 'Setting' => 'Device information' => 'Device status' => 'Ip adress'\n
The ssh command should look like this: 'ssh admin@192.168.x.x -p 8022'\n
You should change yor password now using 'passwd' (once connted via ssh)"
