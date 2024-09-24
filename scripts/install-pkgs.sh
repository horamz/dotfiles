DEV_PACKAGES=(
    "git" "gh" "vim" "pkg-config" "rust" "zed"
)

function install_rust() {
    if command -v rustup &> /dev/null; then
        rustup update
    else
        curl https://sh.rustup.rs -sSf | sh -s -- -y
    fi
}

function install_zed() {
    if command -v zed &> /dev/null; then
        curl -f https://zed.dev/install.sh | sh
    fi

    current_shell=$(basename "$SHELL")

    if [ current_shell == "bash" ] -a \
        [[ ":$PATH:" == *"$HOME/.local/bin"* ]];
    then
        echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
    fi
}


for pkg in ${DEV_PACKAGES[@]};
do
    if declare -f install_$pkg &> /dev/null; then
        # Package requires manuall install
        install_$pkg
    else
        # Install through package manager
        if command -v apt-get &> /dev/null; then
            sudo apt-get install $pkg -y
        elif command -v pacman &> /dev/null; then
            sudo pacman -S $pkg
        else
            echo "Unsupported Distro!"
        fi
    fi
done


