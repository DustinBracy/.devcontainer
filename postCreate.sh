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
npm install -g npm@latest google-protobuf protoc-gen-grpc-web @connectrpc/connect @connectrpc/connect-web @bufbuild/protobuf @bufbuild/protoc-gen-es
go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest
go install github.com/bufbuild/buf/cmd/buf@latest
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install connectrpc.com/connect/cmd/protoc-gen-connect-go@latest