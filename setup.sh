if [[ -t 1 ]]
then
    escape() { printf "\033[%sm" "$1"; }
else
    escape() { :; }
fi

mkcolor() { escape "1;$1"; }
mksecondarycolor() { escape "0;$1"; }
underline="$(escape "4;39")"
blue="$(mkcolor 34)"
red="$(mkcolor 31)"
orange="$(mksecondarycolor 33)"
green="$(mkcolor 32)"
yellow=$(mkcolor 33)
bold="$(mkcolor 39)"
reset="$(escape 0)"
cyan="$(mkcolor 36)"
shell_join() {
    local arg
    printf "%s" "$1"
    shift
    for arg in "$@"
    do
        printf " "
        printf "%s" "${arg// /\ }"
    done
}
arrow() {
    printf "${blue}==>${bold} %s${reset}\n" "$(shell_join "$@")"
}
change() {
    printf "${yellow}==>${bold} %s${reset}\n" "$(shell_join "$@")"
}
ok() {
    printf "${green}==>${bold} %s${reset}\n" "$(shell_join "$@")"
}
good() {
    printf "${green}$(shell_join $@)${reset}\n"
}
warn() {
    printf "${yellow}Warning${reset}: %s\n" "$(shell_join "$@")"
}
error() {
    printf "${red}ERROR${reset}: %s\n" "$(shell_join "$@")"
}
info() {
    printf "\n${blue}Info${reset}: %s\n" "$(shell_join "$@")"
}

printf "${cyan}Setting up the mac...${NC}\n\n"
# Install xcode command line tools
if ! xcode-select --print-path &> /dev/null; then
    arrow "Installing xcode command line tools"
    if xcode-select --install &> /dev/null; then
        ok "Xcode command line tools installed"
    else
        warn "Failed to install xcode command line tools"
        exit 1
    fi
else
    info "Xcode command line tools already installed"
fi

# Install homebrew
if test ! "$(which brew)"; then
    arrow "Installing homebrew"
    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    then
        ok "Homebrew installed"
    else
        warn "Failed to install homebrew"
        exit 1
    fi
else
    info "Homebrew already installed"
    # Upgrade homebrew
    arrow "Updating homebrew"
    brew update
    ok "Homebrew updated"
    # upgrade packages
    arrow "Upgrading packages"
    brew upgrade 2> /dev/null
    ok "Packages upgraded"
fi

# Install packages

# Casks
#     brew_casks:
#      - google-chrome
#      - gimp
#      - docker
#      - rectangle
#      - hiddenbar
#      - visual-studio-code
#      - raycast
#      - figma
#      - sf-symbols
info "Installing casks"
arrow "Installing google-chrome"
if brew info google-chrome &>/dev/null; then
    info "google-chrome already installed"
else
    if brew install --cask google-chrome
    then
        ok "google-chrome installed"
    else
        warn "Failed to install google-chrome"
        exit 1
    fi
fi

arrow "Installing discord"
if brew info discord &>/dev/null; then
    info "discord already installed"
else
    if brew install --cask discord
    then
        ok "discord installed"
    else
        warn "Failed to install discord"
        exit 1
    fi
fi


arrow "Installing gimp"
if brew info gimp &>/dev/null; then
    info "gimp already installed"
else
    if brew install --cask gimp
    then
        ok "gimp installed"
    else
        warn "Failed to install gimp"
        exit 1
    fi
fi

arrow "Installing raycast"
if brew info raycast &>/dev/null; then
    info "raycast already installed"
else
    if brew install --cask raycast
    then
        ok "raycast installed"
    else
        warn "Failed to install raycast"
        exit 1
    fi
fi

arrow "Installing docker"
if brew info docker &>/dev/null; then
    info "docker already installed"
else
    if brew install --cask docker
    then
        ok "docker installed"
    else
        warn "Failed to install docker"
        exit 1
    fi
fi


arrow "Installing rectangle"
if brew info rectangle &>/dev/null; then
    info "rectangle already installed"
else
    if brew install --cask rectangle
    then
        ok "rectangle installed"
    else
        warn "Failed to install rectangle"
        exit 1
    fi
fi

arrow "Installing hiddenbar"
if brew info hiddenbar &>/dev/null; then
    info "hiddenbar already installed"
else
    if brew install --cask hiddenbar
    then
        ok "hiddenbar installed"
    else
        warn "Failed to install hiddenbar"
        exit 1
    fi
fi


arrow "Installing visual-studio-code"
if brew info visual-studio-code &>/dev/null; then
    info "visual-studio-code already installed"
else
    if brew install --cask visual-studio-code
    then
        ok "visual-studio-code installed"
    else
        warn "Failed to install visual-studio-code"
        exit 1
    fi
fi

arrow "Installing figma"
if brew info figma &>/dev/null; then
    info "figma already installed"
else
    if brew install --cask figma
    then
        ok "figma installed"
    else
        warn "Failed to install figma"
        exit 1
    fi
fi

arrow "Installing sf-symbols"
if brew info sf-symbols &>/dev/null; then
    info "sf-symbols already installed"
else
    if brew install --cask sf-symbols
    then
        ok "sf-symbols installed"
    else
        warn "Failed to install sf-symbols"
        exit 1
    fi
fi

info "Installing formulae"

# Essentials
info "Installing essentials"
arrow "Installing curl"
if brew info curl &>/dev/null; then
    info "curl already installed"
else
    if brew install curl
    then
        ok "curl installed"
    else
        warn "Failed to install curl"
        exit 1
    fi
fi

arrow "Installing git"
if brew info git &>/dev/null; then
    info "git already installed"
else
    if brew install git
    then
        ok "git installed"
    else
        warn "Failed to install git"
        exit 1
    fi
fi

arrow "Installing n"
if brew info n &>/dev/null; then
    info "n already installed"
else
    if brew install n
    then
        ok "n installed"
    else
        warn "Failed to install n"
        exit 1
    fi
fi

arrow "Installing jq"
if brew info jq &>/dev/null; then
    info "jq already installed"
else
    if brew install jq
    then
        ok "jq installed"
    else
        warn "Failed to install jq"
        exit 1
    fi
fi

arrow "Installing coreutils"
if brew info coreutils &>/dev/null; then
    info "coreutils already installed"
else
    if brew install coreutils
    then
        ok "coreutils installed"
    else
        warn "Failed to install coreutils"
        exit 1
    fi
fi

arrow "Installing gnupg"
if brew info gnupg &>/dev/null; then
    info "gnupg already installed"
else
    if brew install gnupg
    then
        ok "gnupg installed"
    else
        warn "Failed to install gnupg"
        exit 1
    fi
fi

arrow "Installing cmake"
if brew info cmake &>/dev/null; then
    info "cmake already installed"
else
    if brew install cmake
    then
        ok "cmake installed"
    else
        warn "Failed to install cmake"
        exit 1
    fi
fi

arrow "Installing ffmpeg"
if brew info ffmpeg &>/dev/null; then
    info "ffmpeg already installed"
else
    if brew install ffmpeg
    then
        ok "ffmpeg installed"
    else
        warn "Failed to install ffmpeg"
        exit 1
    fi
fi

arrow "Installing wget"
if brew info wget &>/dev/null; then
    info "wget already installed"
else
    if brew install wget
    then
        ok "wget installed"
    else
        warn "Failed to install wget"
        exit 1
    fi
fi
# end of essentials

info "Installing devops tools"
arrow "Installing awscli"
if brew info awscli &>/dev/null; then
    info "awscli already installed"
else
    if brew install awscli
    then
        ok "awscli installed"
    else
        warn "Failed to install awscli"
        exit 1
    fi
fi

arrow "Installing terraform"
if brew info terraform &>/dev/null; then
    info "terraform already installed"
else
    if brew install terraform
    then
        ok "terraform installed"
    else
        warn "Failed to install terraform"
        exit 1
    fi
fi

arrow "Installing redis"
if brew info redis &>/dev/null; then
    info "redis already installed"
else
    if brew install redis
    then
        ok "redis installed"
    else
        warn "Failed to install redis"
        exit 1
    fi
fi

arrow "Installing cocoapods"
if brew info cocoapods &>/dev/null; then
    info "cocoapods already installed"
else
    if brew install cocoapods
    then
        ok "cocoapods installed"
    else
        warn "Failed to install cocoapods"
        exit 1
    fi
fi

# end of devops tools

# Neovim scripting stuff
info "Installing scripting tools"
arrow "Installing fzf"
if brew info fzf &>/dev/null; then
    info "fzf already installed"
else
    if brew install fzf
    then
        ok "fzf installed"
    else
        warn "Failed to install fzf"
        exit 1
    fi
fi

arrow "Installing neovim"
if brew info neovim &>/dev/null; then
    info "neovim already installed"
else
    if brew install neovim
    then
        ok "neovim installed"
    else
        warn "Failed to install neovim"
        exit 1
    fi
fi

arrow "Installing tmux"
if brew info tmux &>/dev/null; then
    info "tmux already installed"
else
    if brew install tmux
    then
        ok "tmux installed"
    else
        warn "Failed to install tmux"
        exit 1
    fi
fi

arrow "Installing ripgrep"
if brew info ripgrep &>/dev/null; then
    info "ripgrep already installed"
else
    if brew install ripgrep
    then
        ok "ripgrep installed"
    else
        warn "Failed to install ripgrep"
        exit 1
    fi
fi

arrow "Installing imagemagick"
if brew info imagemagick &>/dev/null; then
    info "imagemagick already installed"
else
    if brew install imagemagick
    then
        ok "imagemagick installed"
    else
        warn "Failed to install imagemagick"
        exit 1
    fi
fi


arrow "Installing tree-sitter"
if brew info tree-sitter &>/dev/null; then
    info "tree-sitter already installed"
else
    if brew install tree-sitter
    then
        ok "tree-sitter installed"
    else
        warn "Failed to install tree-sitter"
        exit 1
    fi
fi

# End of scripts

# Language specific tools
info "Installing language specific tools"
arrow "Installing pyenv"
if brew info pyenv &>/dev/null; then
    info "pyenv already installed"
else
    if brew install pyenv
    then
        ok "pyenv installed"
    else
        warn "Failed to install pyenv"
        exit 1
    fi
fi

arrow "Installing go"
if brew info go &>/dev/null; then
    info "go already installed"
else
    if brew install go
    then
        ok "go installed"
    else
        warn "Failed to install go"
        exit 1
    fi
fi

arrow "Installing rustup-init"
if brew info rustup-init &>/dev/null; then
    info "rustup-init already installed"
else
    if brew install rustup-init
    then
        ok "rustup-init installed"
    else
        warn "Failed to install rustup-init"
        exit 1
    fi
fi

arrow "Installing elixir"
if brew info elixir &>/dev/null; then
    info "elixir already installed"
else
    if brew install elixir
    then
        ok "elixir installed"
    else
        warn "Failed to install elixir"
        exit 1
    fi
fi

# End of language specific tools
# End of tools

info "Starting configuration"

# Config Git
info "Git config"
arrow "What is your git user name?"
read gitUserName
arrow "What is your git email?"
read gitEmail
git config --global user.name $gitUserName
git config --global user.email $gitEmail
ok "Git config done"

# Vscode key repeat
arrow "Setting up vscode key repeat"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Column view by default in finder
arrow "Column view by default in finder"
defaults write com.apple.finder FXPreferredViewStyle Clmv

# Make dock smaller
arrow "Making dock smaller"
defaults write com.apple.dock "tilesize" -int "36" && killall Dock

# Make dock autohide
arrow "Making dock autohide"
defaults write com.apple.dock "autohide" -bool "true" && killall Dock

# Show hidden files in finder
arrow "Showing hidden files in finder"
defaults write com.apple.finder AppleShowAllFiles YES

# Make dock open instantly
arrow "Making dock open instantly"
defaults write com.apple.dock "autohide-delay" -float "0" && killall Dock

# Don't show recents in dock
arrow "Don't show recents in dock"
defaults write com.apple.dock "show-recents" -bool "false" && killall Dock

# Enabling the Develop menu and the Web Inspector in Safari
arrow "Enabling the Develop menu in Safari"
open -a Safari
osascript -e 'quit app "Safari"'
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true

killall Finder

# Dotfiles
info "Installing dotfiles. You must set up ssh keys first"
read -p "Press enter to continue"

arrow "Cloning dotfiles"
# if dotfiles dir doesn't exist
if [ ! -d "$HOME/.dotfiles" ]
then
    git clone --bare git@github.com:vibovenkat123/.dotfiles.git "$HOME/.dotfiles"
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" checkout
else
    info "dotfiles already cloned"
fi

# Install node
arrow "Installing node"
if test ! "$(which node)"; then
    sudo n latest
    ok "node installed"
else
    info "node already installed"
fi

good "Done"

arrow "Installing oh-my-tmux"
rm -rf ~/oh_my_tmux
git clone https://github.com/gpakosz/.tmux.git ~/oh_my_tmux
rm -rf ~/.config/tmux/{tmux.conf,tmux.conf.local}
ln -s ~/oh_my_tmux/.tmux.conf ~/.config/tmux/tmux.conf
ln -s ~/oh_my_tmux/.tmux.conf.local ~/.config/tmux/tmux.conf.local

arrow "Installing gippity"
wget "https://drive.google.com/uc?export=download&id=18MgcIbUVS3JyTRh44BiLSvvKUfbaeUur" -O gpt.zip
unzip  gpt.zip
rm -rf __MACOSX
rm -rf gpt.zip
mv *.app /Applications/
