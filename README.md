# Dotfiles

Elite Dotfiles.

| Tool | Description |
|---|---|
| hypr | Forked from JaKooLit |
| kitty | Best for nvim with images |
| nvim | Lazyvim on steroids |
| oh-my-zsh | Easy shell improvement |
| pipewire | Adds rnn noise cancellation to mic |
| skhd | Similar to hypr config |
| tmux | Vim like movement, session management, and awesome popups |
| waybar | Forked from JaKooLit |
| wezterm | Amazing terminal |
| yabai | Window tiling for Mac OS |

## Usage

### Install

Backs up original files into ./backup/ which is gitignored, deletes original config files, then creates symlinks to the dotfiles folder.

```bash
git clone https://github.com/huncholane/dotfiles ~/.dotfiles
cd ~/.dotfiles
./manage.sh install
```
