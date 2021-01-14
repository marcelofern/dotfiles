echo "Clean up the files created during installation"
rm -rf ~/.config ~/.zshrc ~/.xinitrc

echo "Move files from the dotfiles folder into the ~ folder"
cp -rf ~/dotfiles/* ~
cp -rf ~/dotfiles/.config ~/.config
cp -rf ~/dotfiles/.xinitrc ~/.xinitrc
cp -rf ~/dotfiles/.zshrc ~/.zshrc
cp -rf ~/dotfiles/.config ~/.config
cp -rf ~/dotfiles/.git ~/.git
cp -rf ~/dotfiles/.gitignore ~/.gitignore

echo "Setting the terminal theme"
wal --theme base16-gruvbox-soft

echo "Applying wallpaper"
nitrogen --save --set-auto ~/Wallpapers/mountain-png.png
