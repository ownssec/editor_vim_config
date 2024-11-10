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
-- npm install -g intelephense
-- npm install -g prettier @prettier/plugin-php
-- cargo install stylua
-- composer global require "squizlabs/php_codesniffer=\*"
-- npm install --save-dev eslint-plugin-prettier eslint-config-prettier
-- npm install --save-dev eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint-plugin-react eslint-plugin-react-hooks prettier eslint-config-prettier eslint-plugin-prettier
-- sudo apt install xclip ( for tmux copy selected files using ctrl + [ )

--neovim install--

Make sure all necessary dependencies are installed:
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout v0.10.0
make CMAKE_BUILD_TYPE=Release
sudo make install
