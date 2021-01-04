# Clean up files created during installation
rm -rf ~/.config ~/.zshrc ~/.xinitrc

cp -rf ~/dotfiles/* ~
cp -rf ~/dotfiles/.config ~/.config
cp -rf ~/dotfiles/.xinitrc ~/.xinitrc
cp -rf ~/dotfiles/.zshrc ~/.zshrc
cp -rf ~/dotfiles/.config ~/.config
cp -rf ~/dotfiles/.git ~/.git
cp -rf ~/dotfiles/.gitignore ~/.gitignore

# set the terminal theme
wal --theme base16-gruvbox-soft
