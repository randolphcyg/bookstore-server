package response

import "bookstore/model/manage"

type GoodsCategoryResponse struct {
	GoodsCategory manage.MallGoodsCategory `json:"mallGoodsCategory"`
}
