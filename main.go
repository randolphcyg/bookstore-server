package main

import (
	"fmt"

	"bookstore/core"
	"bookstore/global"
	"bookstore/initialize"

	"github.com/jpillora/overseer"
	"github.com/jpillora/overseer/fetcher"
)

func main() {
	global.VP = core.Viper()      // 初始化Viper
	global.LOG = core.Zap()       // 初始化zap日志库
	global.DB = initialize.Gorm() // gorm连接数据库

	overseer.Run(overseer.Config{
		Program: core.RunWindowsServer,
		Address: fmt.Sprintf(":%d", global.CONFIG.System.Addr),
		Fetcher: &fetcher.File{Path: "./release/arf_next"},
		Debug:   false,
	})
}
