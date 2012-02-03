#!/bin/bash --posix
#
# Eats: space seperated list of ip addresses
# Shits: sshfs connection to daedalus, prefer LAN route
#
iplist=$(ip addr | grep "inet " | cut -d/ -f1 | cut -b 10-)
[ "$iplist" = '127.0.0.1' ] && echo "ERROR: only address is 127.0.0.1" && exit 1
for ip in $iplist
do
    case "$ip" in
        172.*|192.168.*|10.*)
            host='daedalus'
            port='22'
            break
            ;;
        * )
            host='daedalus.dyndns-home.com'
            port='443'
            ;;
    esac
done
echo "Connecting to ~/home @ $host:$port"
sshfs -p $port jake@$host:/home/jake $HOME/daed
#echo "Connecting to /music @ $host:$port"
#sshfs -p $port jake@$host:/shares/mbag/music /music
