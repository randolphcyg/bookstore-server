package response

import "bookstore/model/common"

type BookStoreOrderDetailVO struct {
	OrderId               int                    `json:"orderId"`
	OrderNo               string                 `json:"orderNo"`
	TotalPrice            int                    `json:"totalPrice"`
	PayType               int                    `json:"payType"`
	PayTypeString         string                 `json:"payTypeString"`
	OrderStatus           int                    `json:"orderStatus"`
	OrderStatusString     string                 `json:"orderStatusString"`
	CreateTime            common.JSONTime        `json:"createTime"`
	BookStoreOrderItemVOS []BookStoreOrderItemVO `json:"bookStoreOrderItemVOS"`
}

type BookStoreOrderItemVO struct {
	BooksId       int    `json:"booksId"`
	BooksName     string `json:"booksName"`
	BooksCount    int    `json:"booksCount"`
	BooksCoverImg string `json:"booksCoverImg"`
	SellingPrice  int    `json:"sellingPrice"`
}
