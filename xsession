
# use UTF-8 everywhere
export LANG=en_US.UTF-8

# specify location of kshrc
export ENV=$HOME/.kshrc

# load Xresources file
xrdb -merge $HOME/.Xresources

xsetroot -solid slategrey &
xterm &
redshift &

#xbacklight -set 50  # this works only on laptop

#exec i3
#exec startxfce4
exec cwm
