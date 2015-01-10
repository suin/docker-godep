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

## .bashrcの説明

```
go () {
  sudo docker run -it --rm \
  --net host \
  -v /gopath:/gopath \                 # $GOPATHに当たる部分をマウントする
  -v /vagrant:/gopath/src/my-project \ # 自分のプロジェクトも$GOPATH/src配下に置く必要があるのでマウント
  -w /gopath/src/my-project \          # ワーキングディレクトリの設定
  -e GOPATH=/gopath \                  # $GOPATHを指定する
  shouldbee/go go $@
}
```

## godepのインストール

VagrantでDockerホストにつなぎ、go getする。godepの実行ファイルは/gopath/binに置かれる。

```
go get github.com/tools/godep
```

## godepで依存関係定義ファイルを作る

依存するライブラリをgo getしておく。ライブラリは/gopath/srcに置かれる。

```
go get ./...
```

godep saveを実行すると、/vagrant/Godepsに依存関係を定義したファイルができる。

```
godep save
```

## 依存関係定義ファイルをもとにgo getする

以下のコマンドを実行すると、/gopath/srcに依存するパッケージが入る。

```
godep restore
```

## main.goを実行する

```
godep go run main.go 
```
