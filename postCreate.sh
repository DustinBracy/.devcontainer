#!/usr/bin/env bash
python -m pip install --upgrade pip
git config --location=global user.email $GIT_EMAIL
git config --location=global user.name $GIT_USER

# add git autocomplete: https://www.oliverspryn.com/blog/adding-git-completion-to-zsh
mkdir -p ~/.zsh
cd ~/.zsh
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
echo "zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash" >> .zshrc
echo "fpath=(~/.zsh $fpath)" >> .zshrc
echo "autoload -Uz compinit && compinit" >> .zshrc
echo "eval \"$(ssh-agent -s)\" > /dev/null" >> .zshrc

echo "if [ -z \"$SSH_AUTH_SOCK\" ]; then \
   # Check for a currently running instance of the agent \
   RUNNING_AGENT=\"`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`\" \ 
   if [ \"$RUNNING_AGENT\" = \"0\" ]; then \
        # Launch a new instance of the agent \
        ssh-agent -s &> $HOME/.ssh/ssh-agent \
   fi \
   eval `cat $HOME/.ssh/ssh-agent` > /dev/null \
ssh-add $HOME/.ssh/id_ed25519 2> /dev/null \
fi" >> .zshrc
echo "alias dc='docker compose'" >> .zshrc


#install sqlc
go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest


# #install go
# cd /tmp
# wget https://golang.org/dl/go1.19.1.linux-amd64.tar.gz
# sudo tar -C /usr/local -xzf go1.19.1.linux-amd64.tar.gz
# # set up Go lang path #
# echo "export GOPATH=$HOME/go" >> .zshrc
# echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> .zshrc
