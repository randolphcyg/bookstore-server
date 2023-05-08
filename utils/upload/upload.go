package upload

import (
	"mime/multipart"

	"bookstore/global"
)

type OSS interface {
	UploadFile(file *multipart.FileHeader) (string, string, error)
	DeleteFile(key string) error
}

func NewOss() OSS {
	switch global.CONFIG.System.OssType {
	case "local":
		return &Local{}
	default:
		return &Local{}
	}
}
