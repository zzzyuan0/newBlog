package models

import (
	"BlogApiGo/configs/db"
	"time"
)

type TBlogArticle struct {
	Id int64
	UserId int64
	Title string
	Content string
	Heat int32
	CreateTime time.Time
	UpdateTime time.Time
	Visibility int8
	IsTop int8
}

func GetBlogArticle() (article TBlogArticle) {
	db.DB.Where("is_top = 0").Find(&article)
	return article
}
