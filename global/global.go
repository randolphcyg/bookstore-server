package global

import (
	"github.com/spf13/viper"
	"go.uber.org/zap"
	"gorm.io/gorm"

	"bookstore/config"
)

var (
	GVA_DB     *gorm.DB
	GVA_VP     *viper.Viper
	GVA_LOG    *zap.Logger
	GVA_CONFIG config.Server
)
