#!/usr/bin/env sh 

SRC_DIR=./
CONFIG_DIR=~/.config/xkb/
START_DIR=~/.config/autostart/
MAP_DIR="unikeymap/"
DESK_FILE="unikeyboard.desktop"


if [ "$1" = "remove" ]; then

	echo "Do you want to completely remove UniKeyBoard?"
	echo -n "(y|n)? > "; read yn </dev/tty
	if [ "$yn" != "${yn#[Yy]}" ] ;then
		echo "Uninstalling UniKeyBoard..."
		rm -r "${CONFIG_DIR}${NAME}"
	fi
	exit 0
fi


echo "Installing UniKeyBoard."

mkdir -p ${CONFIG_DIR}
echo "Copying kxb map files to ${CONFIG_DIR}"
if [ -d "${SRC_DIR}${MAP_DIR}" ]; then
	#mkdir -p "${CONFIG_DIR}${MAP_DIR}"
	cp -r "${SRC_DIR}${MAP_DIR}" "${CONFIG_DIR}"
	echo "DONE!"
else
	echo "ERROR!"
	echo "Could not find ${SRC_DIR}${MAP_DIR}!"
	exit 1
fi

echo "Copying startup entry of UniKeyBoard to ${START_DIR}"
if [ -d "${START_DIR}" ]; then
	cp "${SRC_DIR}${DESK_FILE}" "${START_DIR}/"
	chmod +x "${START_DIR}${DESK_FILE}"
	echo "DONE!"
else
	echo "ERROR!"
	echo "${START_DIR} does not exist!"
	exit 1
fi


exit 0
