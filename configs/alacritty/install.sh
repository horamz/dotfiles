function manual_install() {
    if ! command -v cargo &> /dev/null;
    then
        echo "Install rust before proceeding"
        exit 1
    fi

    if command -v apt-get &> /dev/null; then
        sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
    fi

    cargo install alacritty
}

function setup_config() {
    echo "Configurating alacritty..."

    config_path="$HOME/.config/alacritty"

    if ! [ -d "$config_path" ]; then
        mkdir -p "$config_path"
    fi

    cp ./alacritty.toml "$config_path" || {
        echo "Error: Couldn't copy alacritty config"
        exit 1
    }

    echo "Finished configurating alacritty"
}

if command -v apt-get &> /dev/null;
then
    manual_install
elif command -v pacman &> /dev/null;
then
    sudo pacman -S alacritty
else
    echo "Unsupported Distro!"
    exit 1
fi

setup_config
