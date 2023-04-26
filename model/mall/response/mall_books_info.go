package response

type BooksSearchResponse struct {
	BooksId       int    `json:"booksId"`
	BooksName     string `json:"booksName"`
	BooksIntro    string `json:"booksIntro"`
	BooksCoverImg string `json:"booksCoverImg"`
	SellingPrice  int    `json:"sellingPrice"`
}

type BooksInfoDetailResponse struct {
	BooksId            int      `json:"booksId"`
	BooksName          string   `json:"booksName"`
	BooksIntro         string   `json:"booksIntro"`
	BooksCoverImg      string   `json:"booksCoverImg"`
	SellingPrice       int      `json:"sellingPrice"`
	BooksDetailContent string   `json:"booksDetailContent"  `
	OriginalPrice      int      `json:"originalPrice" `
	Tag                string   `json:"tag" form:"tag" `
	BooksCarouselList  []string `json:"booksCarouselList" `
}
