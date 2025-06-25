#!/usr/bin/env bash
git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USER
git config --global pull.rebase false  # merge by default

cat <<EOT >> ~/.bashrc
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
EOT

mkdir -p ~/.local/share/bash-completion/completions
docker completion bash > ~/.local/share/bash-completion/completions/docker
echo "alias dc='docker compose'" >> ~/.bashrc

source ~/.bashrc
