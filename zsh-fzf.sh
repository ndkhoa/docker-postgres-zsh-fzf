#!/bin/bash

BUILD_PACKAGES="git curl wget zsh vim tmux tree htop tzdata"
DEBIAN_FRONTEND="noninteractive"
TZ="Asia/Ho_Chi_Minh"

apt-get update && apt-get -y upgrade && apt-get install -y $BUILD_PACKAGES
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && dpkg-reconfigure -f $DEBIAN_FRONTEND tzdata

curl -sSL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -ie "s/plugins=(git)/plugins=(git common-aliases zsh-autosuggestions zsh-syntax-highlighting)/g" ~/.zshrc

git clone https://github.com/denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt
ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme
sed -ie 's/ZSH_THEME="robbyrussell"/ZSH_THEME="spaceship"/g' ~/.zshrc

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all

rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt/* && apt-get clean
