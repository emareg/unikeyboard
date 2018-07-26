#!/bin/bash

#xkbcomp -I/home/${USER}/.config/xkb/ /home/${USER}/.config/xkb/mymap $DISPLAY
xkbcomp -I. unikeymap $DISPLAY

