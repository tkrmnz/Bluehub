#!/usr/bin/expect -f

set prompt "#"
set hci [lindex $argv 0]
set dev [lindex $argv 1]
send_user "hci $hci\n"
send_user "dev $dev\n"

spawn sudo rm -rf /var/lib/bluetooth/$hci
sleep 1
spawn sudo bluetoothctl -a
expect -re $prompt
send "select $hci\r"
expect -re $prompt
send "power on\r"
sleep 1
expect -re $prompt
send "scan on\r"
#send_user "\nSleeping\r"
sleep 5
#send_user "\nDone sleeping\r"
send "scan off\r"
expect "Controller"
send "trust $dev\r"
sleep 2
send "pair $dev\r"
sleep 2
#send "0000\r"
#sleep 3
#send_user "\nShould be paired now.\r"
send "connect $dev\r"
sleep 2
send "quit\r"
expect eof
