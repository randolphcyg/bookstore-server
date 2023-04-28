package mall

import (
	"errors"

	"github.com/jinzhu/copier"

	"bookstore/global"
	"bookstore/model/mall"
	mallReq "bookstore/model/mall/request"
	mallRes "bookstore/model/mall/response"
	"bookstore/model/manage"
)

type MallBooksInfoService struct {
}

// MallBooksListBySearch 图书搜索分页
func (m *MallBooksInfoService) MallBooksListBySearch(pageNumber int, booksCategoryId int, keyword string, orderBy string) (err error, searchBooksList []mallRes.BooksSearchResponse, total int64) {
	// 根据搜索条件查询
	var booksList []manage.MallBooksInfo
	db := global.GVA_DB.Model(&manage.MallBooksInfo{})
	if keyword != "" {
		db.Where("books_name like ? or books_intro like ?", "%"+keyword+"%", "%"+keyword+"%")
	}
	if booksCategoryId >= 0 {
		db.Where("books_category_id= ?", booksCategoryId)
	}
	err = db.Count(&total).Error
	switch orderBy {
	case "new":
		db.Order("books_id desc")
	case "price":
		db.Order("selling_price asc")
	default:
		db.Order("stock_num desc")
	}
	limit := 10
	offset := 10 * (pageNumber - 1)
	err = db.Limit(limit).Offset(offset).Find(&booksList).Error
	// 返回查询结果
	for _, books := range booksList {
		searchBooks := mallRes.BooksSearchResponse{
			BooksId:       *books.BooksId,
			BooksName:     books.BooksName,
			BooksIntro:    books.BooksIntro,
			BooksCoverImg: books.BooksCoverImg,
			SellingPrice:  *books.SellingPrice,
		}
		searchBooksList = append(searchBooksList, searchBooks)
	}
	return
}

// GetMallBooksInfo 获取图书信息
func (m *MallBooksInfoService) GetMallBooksInfo(id int) (err error, res mallRes.BooksInfoDetailResponse) {
	var mallBooksInfo manage.MallBooksInfo
	err = global.GVA_DB.Where("books_id = ?", id).First(&mallBooksInfo).Error
	if mallBooksInfo.BooksSellStatus != 0 {
		return errors.New("图书已下架"), mallRes.BooksInfoDetailResponse{}
	}
	err = copier.Copy(&res, &mallBooksInfo)
	if err != nil {
		return err, mallRes.BooksInfoDetailResponse{}
	}
	var list []string
	list = append(list, mallBooksInfo.BooksCarousel)
	res.BooksCarouselList = list

	var comments []manage.MallBooksComment
	err = global.GVA_DB.Where("books_id = ?", id).Find(&comments).Error
	err = copier.Copy(&res.BookStoreBookCommentVOS, &comments)

	for idx, comment := range res.BookStoreBookCommentVOS {
		res.BookStoreBookCommentVOS[idx].Time = comment.CommentTime.Format("2006年1月2日 15:04:05")
	}

	return
}

func (m *MallUserService) CreateBookComment(token string, req mallReq.CreateBookCommentParam) (err error) {
	var userToken mall.MallUserToken
	err = global.GVA_DB.Where("token =?", token).First(&userToken).Error
	if err != nil {
		return errors.New("不存在的用户")
	}

	var user manage.MallUser
	err = global.GVA_DB.Where("user_id =?", userToken.UserId).First(&user).Error
	if err != nil {
		return errors.New("不存在的用户")
	}

	// 查询某个人所有的订单
	var mallOrders []manage.MallOrder
	if err = global.GVA_DB.Where("user_id=? and order_status = 4 and is_deleted = 0", userToken.UserId).Find(&mallOrders).Error; err != nil {
		return errors.New("您未购买过该图书，无权评论！")
	}

	bookIDs := make(map[int]struct{})
	// 查询某个人所有的订单 中的所有书的ID
	for _, o := range mallOrders {
		var orderItems []manage.MallOrderItem
		err = global.GVA_DB.Where("order_id = ?", o.OrderId).Find(&orderItems).Error
		if len(orderItems) <= 0 {
			continue
		}

		for _, b := range orderItems {
			bookIDs[b.BooksId] = struct{}{}
		}
	}

	// 判断此人是否买过此书
	isPurchaseThisBook := false
	_, ok := bookIDs[int(req.BooksID)]
	if ok {
		isPurchaseThisBook = true
	}

	if !isPurchaseThisBook {
		return errors.New("您未购买过该图书，无权评论！")
	}

	data := &manage.MallBooksComment{
		FromId:      int64(userToken.UserId),
		Name:        user.NickName,
		Comment:     req.Comment,
		To:          req.To,
		ToId:        req.ToId,
		CommentTime: req.CommentTime,
		BooksId:     req.BooksID,
		InputShow:   true,
	}

	return global.GVA_DB.Create(data).Error
}
