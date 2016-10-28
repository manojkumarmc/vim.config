#! /bin/bash

yum install -y git tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack

echo set -g @plugin 'tmux-plugins/tpm' >> ~/.tmux.conf
echo set -g @plugin 'tmux-plugins/tmux-sensible' >> ~/.tmux.conf
# echo source-file "${HOME}/.tmux-themepack/powerline/block/green.tmuxtheme" >> ~/.tmux.conf
echo set -g @plugin 'jimeh/tmux-themepack' >> ~/.tmux.conf
echo run '~/.tmux/plugins/tpm/tpm' >> ~/.tmux.conf

~/.tmux/plugins/tpm/bin/install_plugins

