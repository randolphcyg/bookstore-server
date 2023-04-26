package request

type BooksSearchParams struct {
	Keyword         string `form:"keyword"`
	BooksCategoryId int    `form:"booksCategoryId"`
	OrderBy         string `form:"orderBy"`
	PageNumber      int    `form:"pageNumber"`
}
