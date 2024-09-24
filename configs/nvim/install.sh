#!/bin/bash

function manuall_install() {

    local_dir="$HOME/.local"
    neovim_repo="neovim/neovim"
    install_link="https://github.com/$neovim_repo/releases/latest/download/nvim-linux64.tar.gz"
    tag_link="https://api.github.com/repos/$neovim_repo/releases/latest"

    function install_from_repo() {
        echo "Downloading neovim..."

        basename="nvim-linux64"
        download_tar="$basename.tar.gz"

        curl -s -L -o $download_out $install_link || {
            echo "Failed to fetch neovim from github releases."
            exit 1
        }

        echo "Extracting..."
        tar xzvf "$download_tar"
        rm "$download_tar"

        mv $basename $local_dir

        if ![ -h "$local_dir/$basename/nvim"]; then
            echo "Creating symlink..."
            ln -s "$local_dir/$basename/bin/nvim" "$local_dir/bin/nvim"
        fi

        echo "Successfully installed neovim"
    }

    function compare_semantic_versions() {
        if [ $1 != $2 ] && [ $(printf "$1\n$2" | sort -v | head -n 1) == "$1" ];
        then
            return 0
        else
            return 1
        fi
    }

    if command -v nvim &> /dev/null;
    then
        nvim_version=$(nvim --version | head -n 1 | awk '{print $2}')
        echo "Neovim installation found: $nvim_version"

        latest_release=$(curl -s $tag_link)

        if [ $? -ne 0 ];
        then
            echo "Error fetching latest version. Proceeding with current install..."
        else
            latest_version=$(echo "$latest_release" | jq -r .tag_name)
            if [ "$latest_version" == "null" ];
            then
                echo "Error extracting latest version. Proceeding with current install..."
            else
                compare_semantic_versions "$latest_version" "$nvim_version" && {
                    echo "Newer version found: $latest_version"
                    install_from_repo
                }
            fi
        fi
    else
        install_from_repo
    fi
}


function setup_config() {
    echo "Configurating neovim..."
    config_path="$HOME/.config/nvim"
    config_backup_path="$HOME/.config/nvim.bak"

    if [ -d "$config_path" ]; then
        echo "nvim directory exists"
        echo "Backupping nvim to nvim.bak"
        rm -r "$config_backup_path" 2> /dev/null
        mv "$config_path" "$config_backup_path"
        mkdir -p "$config_path"
    else
        echo "nvim config doesn't exist so creating one"
        mkdir -p "$config_path"
    fi

    { cp -r ./init.lua "$config_path" && cp -r lua "$config_path" ;} || {
        echo "Error: Couldn't copy nvim config"
        exit 1
    }

    echo "Finished configurating neovim"
}

if command -v apt-get &> /dev/null; then
    manuall_install
elif command -v pacman &> /dev/null; then
    sudo pacman -S neovim
else
    echo "Unsupported Distro!"
    exit 1
fi

setup_config


