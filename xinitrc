#! /usr/bin/env bash
#
#map esc to capslock-key
# if ~/.xmodmap exists
 if [ -f $HOME/.xmodmap]; then
     #execute .xmodmap in a shell
     bash -c "/usr/bin/xmodmap $HOME/.xmodmap" &
 fi

exec startxfce4
