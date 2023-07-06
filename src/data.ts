import { BrewPackageOptions, ShellCommandOpts } from "@vaibhavvenkat/aacod"

export const casks: Pick<BrewPackageOptions, "name">[] = [
    {
        name: "google-chrome",
    },
    {
        name: "discord",
    },
    {
        name: "gimp",
    },
    {
        name: "raycast",
    },
    {
        name: "docker",
    },
    {
        name: "rectangle"
    },
    {
        name: "hiddenbar"
    },
    {
        name: "visual-studio-code"
    },
    {
        name: "figma",
    },
    {
        name: "sf-symbols",
    },
]

export const formulas: Pick<BrewPackageOptions, "name">[] = [
    {
        name: "curl",
    },
    {
        name: "git",
    },
    {
        name: "n",
    },
    {
        name: "jq",
    },
    {
        name: "coreutils",
    },
    {
        name: "gnupg",
    },
    {
        name: "cmake",
    },
    {
        name: "ffmpeg",
    },
    {
        name: "wget",
    },
    {
        name: "awscli",
    },
    {
        name: "terraform",
    },
    {
        name: "redis",
    },
    {
        name: "cocoapods",
    },
    {
        name: "fzf",
    },
    {
        name: "neovim"
    },
    {
        name: "tmux"
    },
    {
        name: "ripgrep"
    },
    {
        name: "imagemagick"
    },
    {
        name: "tree-sitter"
    },
    {
        name: "pyenv"
    },
    {
        name: "go"
    },
    {
        name: "rustup-init",
    },
    {
        name: "elixir",
    },
]


export const cmds: Command[] = [
    {
        command: "xcode-select --install &> /dev/null",
        silent: false,
        success_msg: "Xcode installed successfully!",
        error_msg: "Xcode installation failed!",
    },
    {
        command: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)`,
        silent: false,
        success_msg: "Homebrew installed successfully!",
        error_msg: "Homebrew installation failed!",
    },
]

export const defaults: string[] = [
    "defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false",
    "defaults write com.apple.finder FXPreferredViewStyle Clmv",
    `defaults write com.apple.dock "tilesize" -int "36" && killall Dock`,
    `defaults write com.apple.dock "autohide" -bool "true" && killall Dock`,
    "defaults write com.apple.finder AppleShowAllFiles YES",
    `defaults write com.apple.dock "autohide-delay" -float "0" && killall Dock`,
    `defaults write com.apple.dock "show-recents" -bool "false" && killall Dock`,
    `open -a Safari && osascript -e 'quit app "Safari"' && \\
        defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true && \\
        defaults write com.apple.Safari IncludeDevelopMenu -bool true`,
    "killall Finder",
]

type Command = ShellCommandOpts & {
    success_msg: string,
    error_msg: string
}


export const other_tools = [
    "sudo n latest",
    `bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"`,
    `opam init`,
    `opaminstall dune merlin ocaml-lsp-server odoc ocamlformat utop dune-release -y`,
]
