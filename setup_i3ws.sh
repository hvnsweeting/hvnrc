#!/bin/sh
# sudo ln -s FULL_ADDRESS_TO_THIS_FILE /usr/bin/ws
# then you can Meta+d ws to start your setup workspace

i3-msg workspace 1:code; i3-msg exec gnome-terminal;
i3-msg workspace 3:chat; i3-msg exec pidgin
i3-msg workspace 3:chat; i3-msg exec skype
sleep 2
i3-msg workspace 2:net; i3-msg exec firefox
