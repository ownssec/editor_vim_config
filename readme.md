-- install this first

-- plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

-- ............................--
-- Prerequisites
Make sure you have installed the latest version of Neovim v0.9.0++.
Have git, make, pip, python, npm, node and cargo installed on your system.
npm i -g typescript-language-server
-- ............................--

-- ............................--
--tokyonight Background . night theme
--modified from folder...
--example path : /home/e/.local/share/nvim/plugged/
night theme 
bg && bg_dark color='#1f1f1f'
bg-color #1f1f1f
-- ............................--

-- ............................--
-- for telescope find worse .
-- need to install this ripgrep
 sudo apt-get install ripgrep
-- ............................--

