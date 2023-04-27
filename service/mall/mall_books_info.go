package mall

import (
	"errors"

	"github.com/jinzhu/copier"

	"bookstore/global"
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

	return
}
