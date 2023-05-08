package manage

import (
	"bookstore/global"
	"bookstore/model/manage"
)

type ManageAdminUserTokenService struct {
}

func (m *ManageAdminUserTokenService) ExistAdminToken(token string) (err error, mallAdminUserToken manage.MallAdminUserToken) {
	err = global.DB.Where("token =?", token).First(&mallAdminUserToken).Error
	return
}

func (m *ManageAdminUserTokenService) DeleteMallAdminUserToken(token string) (err error) {
	err = global.DB.Delete(&[]manage.MallAdminUserToken{}, "token =?", token).Error
	return err
}
