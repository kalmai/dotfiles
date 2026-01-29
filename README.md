back up `~/.config/nvim` and `~/.tmux.conf` before proceeding if present.
create system links from this repo to your system with the following:
```
ln -sf ~/dotfiles/.config/nvim      ~/.config/nvim
ln -sf ~/dotfiles/.config/alacritty ~/.config/alacritty
ln -sf ~/dotfiles/.tmux.conf        ~/.tmux.conf
```

### Dependencies
## alacritty
https://github.com/alacritty/alacritty?tab=readme-ov-file#installation

## zsh
https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

## nerd fonts
https://github.com/getnf/getnf?tab=readme-ov-file#installation
`export PATH="$HOME/.local/bin:$PATH"`
add above to `.zshrc` file or just execute it in a shell session and save the fonts required being `Ubuntu Mono NerdFont` for alacritty.

## bob
https://github.com/MordechaiHadad/bob?tab=readme-ov-file#install-with-pacman
`bob install stable`
opening neovim will install all plugins automagically with `lazy.nvim`.
must comment out [this](https://github.com/kalmai/dotfiles/blob/b3c98ea63c61dd1eca7b6491b2b51764eb5bef68/.config/nvim/lua/plugins/telescope.lua#L39) in order for telescope to get installed, then uncomment it out and and restart neovim.

## tmux
https://github.com/tmux-plugins/tpm
execute tmux leader command plus `I` (`C-Space + I`) and plugins will be installed.
