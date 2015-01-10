package main

import (
	log "github.com/Sirupsen/logrus"
	"github.com/codegangsta/cli"
	"os"
)

func main() {
	app := cli.NewApp()
	app.Action = func(c *cli.Context) {
		log.Info("Hello World!")
	}
	app.Run(os.Args)
}
