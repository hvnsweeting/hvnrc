
# use UTF-8 everywhere
export LANG=en_US.UTF-8

# specify location of kshrc
export ENV=$HOME/.kshrc

# load Xresources file
xrdb -merge $HOME/.Xresources

xsetroot -solid grey &
xterm -bg black -fg white +sb &
redshift &
xbacklight -set 50
#export GTK_IM_MODULE=ibus
#export QT_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT4_IM_MODULE=ibus
#export CLUTTER_IM_MODULE=ibus
#export GLFW_IM_MODULE=ibus
exec i3
#exec startxfce4
