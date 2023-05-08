package core

import (
	"fmt"
	"net/http"

	"bookstore/global"
	"bookstore/initialize"

	"github.com/jpillora/overseer"
	"go.uber.org/zap"
)

type server interface {
	ListenAndServe() error
}

func RunWindowsServer(state overseer.State) {
	Router := initialize.Routers()

	address := fmt.Sprintf(":%d", global.CONFIG.System.Addr)

	srv := &http.Server{
		Addr:    address,
		Handler: Router,
	}
	global.LOG.Info("server run success on ", zap.String("address", address))
	if err := srv.Serve(state.Listener); err != nil && err != http.ErrServerClosed {
		return
	}
}
