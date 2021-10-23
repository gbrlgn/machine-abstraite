apt install -y vim git bat zsh unrar p7zip ffmpeg npm htop gnome-music totem shotwell geary libreoffice keepassxc linux-firmware gcc make dkms acpid nvidia-driver-470 ubuntu-restricted-extras qt5-style-plugins steam vulkan-tools powerline golang rustc elixir php clisp fonts-ibm-plex


apt remove -y gnome-photos gnome-calendar gnome-system-monitor gnome-clocks gnome-maps gnome-system-monitor gnome-weather gnome-contacts yelp yelp-xsl gedit evince gnome-font-viewer eog cheese seahorse ubuntu-docs ubuntu-advantage-tools


snap install gimp inkscape spotify gedit gnome-font-viewer evince fractal
snap install codium --classic
snap install intellij-idea-community --classic
vscodium

echo "00000" > /etc/hostname


git config --global user.name "Gabriel Gian"
git config --global user.email "gabrielgian@protonmail.com"


git clone https://github.com/gbrlgian/compsci /home/calabar/Documentos/Git/compsci
git clone https://github.com/gbrlgian/books /home/calabar/Documentos/Git/books
git clone https://github.com/gbrlgian/private /home/calabar/Documentos/Git/private


chsh -s /bin/zsh calabar
mkdir -p /home/calabar/.zsh


sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/home/calabar/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp /home/calabar/Documentos/Git/private/linux/config/zsh/.zshrc /home/calabar/
git clone https://github.com/sindresorhus/pure.git /home/calabar/.zsh/pure

cp -r /home/calabar/Documentos/Git/private/linux/Wallpapers /home/calabar/Imagens

git clone https://github.com/VundleVim/Vundle.vim.git /home/calabar/.vim/bundle/Vundle.vim
cp /home/calabar/Documentos/Git/private/linux/config/.vimrc /home/calabar
vim -c PluginInstall -c q!


rm /usr/share/applications/software-properties-drivers.desktop /usr/share/applications/gnome-language-selector.desktop /usr/share/applications/software-properties-livepatch.desktop

pkill vscodium
mkdir /home/calabar/.vscode-oss/extensions
cp -r /home/calabar/Documentos/Git/private/inconfidente/inconfidente-vscode /home/calabar/.vscode-oss/extensions


sh -c "echo 'export QT_QPA_PLATFORMTHEME=gtk2' >> /etc/environment"


apt update && apt upgrade
apt autoremove
snap refresh


chown -R calabar /home/calabar
