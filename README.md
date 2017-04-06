![Showcase](_images/computer.png?raw=true)
# .dotfiles
## Cloning
### The easy setting
What I use for all computers
```bash
cd ~/wherever
# Use the link to your fork
git clone https://github.com/BrandonRoehl/dotfiles.git
# The folder just made
cd dotfiles
./init
# Plug Install
vim +PlugInstall
```
### Custom or trial / browsing
```bash
git clone --recursive https://github.com/BrandonRoehl/dotfiles.git
```
Or remember to after cloning for the submodules
```bash
git submodule init
git submodule update --recursive
vim +PlugInstall
```
## Making it yours
1. [Fork it](https://github.com/BrandonRoehl/dotfiles/fork)
2. Commit change and share!

## Linuxbrew the right way
```bash
sudo ./installLinuxBrew
```
## Demo
![Showcase](_images/showcase.gif?raw=true)

# Contact
[BrandonRoehl@gmail.com](mailto://brandonroehl@gmail.com)
