# install necessary packages with apt
sudo apt install neovim -y
sudo apt install fzf -y

# install vim-plug for nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

