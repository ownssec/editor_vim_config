-- install this first

Make sure you have installed the latest version of Neovim v0.9.0+.
Have git, make, pip, python, npm, node, cargo and ripgrep installed on your system.

--copy this text and paste it to the location of nvim folder (vim plug)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


-- nerd font for icons_enabled
https://www.nerdfonts.com/font-downloads

-- ............................--
-- Prerequisites
Make sure you have installed the latest version of Neovim v0.9.0++.
Have git, make, pip, python, npm, node and cargo installed on your system.

-- npm i -g typescript-language-server
-- npm install -g vscode-langservers-extracted

-- ............................--

-- ............................--
-- for telescope find worse .
-- need to install this ripgrep
 sudo apt-get install ripgrep
-- ............................--


-- for lazygit commit feature
pip install neovim-remote

--neovim install--

Make sure all necessary dependencies are installed:
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout v0.10.0
make CMAKE_BUILD_TYPE=Release
sudo make install
