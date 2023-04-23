package request

import (
	"bookstore/model/common/request"
)

type MallShopCartSearch struct {
	request.PageInfo
}

type SaveCartItemParam struct {
	GoodsCount int `json:"goodsCount"`
	GoodsId    int `json:"goodsId"`
}

type UpdateCartItemParam struct {
	CartItemId int `json:"cartItemId"`
	GoodsCount int `json:"goodsCount"`
}
