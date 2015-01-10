PROJECT=docker-host
PS1="\`if [ \$? = 0 ]; then echo \[\e[32m\]${PROJECT}\[\e[0m\]; else echo \[\e[31m\]${PROJECT}\[\e[0m\]; fi\`:\w$ "
cd /vagrant

go () {
  sudo docker run -it --rm \
    --net host \
    -v /gopath:/gopath \
    -v /vagrant:/gopath/src/my-project \
    -w /gopath/src/my-project \
    -e GOPATH=/gopath \
    shouldbee/go go $@
}

godep () {
  sudo docker run -it --rm \
    --net host \
    -v /gopath:/gopath \
    -v /vagrant:/gopath/src/my-project \
    -w /gopath/src/my-project \
    -e GOPATH=/gopath \
    shouldbee/go /gopath/bin/godep $@
}
