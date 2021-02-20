#install nvim plugin manager and plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall

#checkout qmk_firmware from my repo
git clone https://github.com/mshlimov/qmk_firmware/
python3 -m pip install --user qmk

#install ohmytmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

#add powerline symbols to tmux status line
echo tmux_conf_theme_left_separator_main=\'\\uE0B0\'
echo tmux_conf_theme_left_separator_sub=\'\\uE0B1\'
echo tmux_conf_theme_right_separator_main=\'\\uE0B2\'
echo tmux_conf_theme_right_separator_main=\'\\uE0B3\'

#setup ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#setup qmk environment
cd ~/qmk_firmware/
qmk setup
qmk config user.keyboard=massdrop/ctrl
qmk config user.keymap=mshlimov
qmk compile

#upgrade thunderbird to the latest version
sudo add-apt-repository -y ppa:ubuntu-mozilla-daily/ppa
sudo apt-get update
sudo apt-get install thunderbird
sudo apt-get upgrade


# create a cloud-config file and provision passwords & ssh keys, mutt, thunderbird 
