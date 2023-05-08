package mall

import (
	"bookstore/global"
	"bookstore/model/mall"
)

type MallUserTokenService struct {
}

func (m *MallUserTokenService) ExistUserToken(token string) (err error, mallUserToken mall.MallUserToken) {
	err = global.DB.Where("token =?", token).First(&mallUserToken).Error
	return
}

func (m *MallUserTokenService) DeleteMallUserToken(token string) (err error) {
	err = global.DB.Delete(&[]mall.MallUserToken{}, "token =?", token).Error
	return err
}
