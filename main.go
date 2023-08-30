package main

import (
	_ "Back-End/internal/packed"

	_ "github.com/gogf/gf/contrib/drivers/pgsql/v2"

	"github.com/gogf/gf/v2/os/gctx"

	"Back-End/internal/cmd"
)

func main() {
	cmd.Main.Run(gctx.GetInitCtx())
}
