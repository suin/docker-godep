# Docker + Godep サンプル


Dockerのホストから`godep`と`go`のコマンドを使えるようにするために、`.bashrc`にコマンドを定義している。

## ファイル構造の対応表

Dockerホスト | Dockerコンテナ
------------|----------------
/gopath     | /gopath
/gopath/src     | /gopath/src
/gopath/bin     | /gopath/bin
/gopath/pkg     | /gopath/pkg
/vagrant    | /gopath/src/my-project
/vagrant/main.go | /gopath/src/my-project/main.go
