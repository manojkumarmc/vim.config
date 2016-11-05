#! /bin/bash

yum install -y gcc ncurses ncurses-devel make libevent libevent-devel automake git epel-release

git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make
make install

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack

echo set -g @plugin 'tmux-plugins/tpm' >> ~/.tmux.conf
echo set -g @plugin 'tmux-plugins/tmux-sensible' >> ~/.tmux.conf
# echo source-file "${HOME}/.tmux-themepack/powerline/block/green.tmuxtheme" >> ~/.tmux.conf
echo set -g @plugin 'jimeh/tmux-themepack' >> ~/.tmux.conf
echo run '~/.tmux/plugins/tpm/tpm' >> ~/.tmux.conf

~/.tmux/plugins/tpm/bin/install_plugins

git clone http://luajit.org/git/luajit-2.0.git
cd luajit-2.0
make && make install

yum install -y ruby ruby-devel lua lua-devel  \
    ctags git python python-devel \
    python34 python34-devel tcl-devel \
    perl perl-devel perl-ExtUtils-ParseXS \
    perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
    perl-ExtUtils-Embed

git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib64/python2.7/config/ \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib64/python3.4/config-3.4m \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80
make install

