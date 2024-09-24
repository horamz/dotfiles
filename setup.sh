#!/bin/bash

LOCAL_DIR="$HOME/.local"
SCRIPTS_DIR="./scripts"
CONFIGS_DIR="./configs"
FONTS_DIR="./fonts"


function check_health() {
    command -v git > /dev/null || {
        echo "Install git before proceeding"
        exit 1
    }

    if [ "$USER" == "root" ]; then
        echo "Do not run the script with sudo"
        exit 1
    fi

    if ! [ -d "$LOCAL_DIR" ]; then
        echo "Local dir does not exist! create ${LOCAL_DIR} before proceeding"
        exit 1
    fi
}


function add_fonts() {
    if [ -d "$FONTS_DIR" ]; then
        mkdir $LOCAL_DIR/share/fonts
        for font in "$FONTS_DIR"/*; do
            cp "$font" $LOCAL_DIR/share/fonts
        done
    fi
}

function install_prerequisites() {
    for script in $SCRIPTS_DIR/*.sh; do
        chmod +x $script
        $script
    done
}

function install_configs() {
    for config in $CONFIGS_DIR/*/; do
        if [ -f $config/install.sh ]; then
            chmod +x $config/install.sh
	    cd $config
            ./install.sh
	    cd ../..
        fi
    done
}


function main() {
    check_health
    add_fonts
    install_prerequisites
    install_configs
}

main
