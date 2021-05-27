# Dotfiles

![](pictures/example_1.png)

## This setup uses:
1) Arch linux
2) i3-gaps windows manager
3) neovim
4) polybar
5) gruv-box theming (via pywal)
6) rofi

## Requirements

This readme does not teach you how to setup Arch linux itself.
To do so, you can either follow the
[arch wiki](https://wiki.archlinux.org/index.php/Installation_guide)
(which I recommend to at least try once in your life), or alternatively use
one installer like [Anarchy](https://www.anarchylinux.org/)

It's paramount that you have nothing apart from internet connection, `git`,
and `base-devel` installed in your environment. I.e, no windows/desktop manager
or anything of the kind as it can cause conflicts in the installation.

## Getting started

1) Download and install my binary that handles my environment:
```sh
git clone https://github.com/marcelofern/arch.git
cd arch
make
cd ..
rm -rf arch
```
2) then run `arch -i` for installing dependencies, then `arch -d` for including
these dotfiles. You can also use `arch -u` to update the system with the
newest changes.
3) After the installation is completed reboot your system.
4) You can get into the i3 session by running `startx` in the terminal.

## Using wifi after installation:
```sh
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
nmtui
```
