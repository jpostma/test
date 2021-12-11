Test
====
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/johan/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions /home/johan/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/johan/.oh-my-zsh/custom/themes/powerlevel10k

echo  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k. >> ~/.zshrc
echo ZSH_THEME="powerlevel10k/powerlevel10k" >> ~/.zshrc
plugins=(git  z zsh-autosuggestions copyfile copydir copybuffer colorize history sudo)
echo https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
