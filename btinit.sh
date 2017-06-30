#!/bin/bash
sudo rm -rf /var/lib/bluetooth
sudo systemctl restart bluetooth
sudo hciconfig hci0 down
sudo hciconfig hci1 down
sudo hciconfig hci2 down
sudo hciconfig hci3 down
sudo hciconfig hci4 down
sudo hciconfig hci5 down
sudo hciconfig hci6 down
pulseaudio --start


