#!/bin/bash
# Script that connects the computer to a wireless network of choice, taking
# some standards (which fit my notebook) for granted, asks the user for
# information if they are not given.

if $(whoami) != "root"; then
				echo "Administrative privileges needed."
				exit 1
fi

echo "What's the name of the network you want to connect to?"
read network_name

echo "What's the passphrase?"
read network_passphrase

if $(ifconfig | grep iwn0) == "false"; then
				echo "Which interface should be used to connect?"
				read interface_name
else
				interface_name = "iwn0"
fi

echo "Connecting to the network .."
if $(ifconfig $interface_name nwid $network_name wpa wpakey $network_passphrase); then
				echo "Connected successfully. Happy surfing!"
else
				echo "Something went wrong, try again. Exiting .."
				exit 1
fi
# FIXME(dot|not): Code neither tested nor refactored. Just a quick writedown.
