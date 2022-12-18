package search

import (
	"BlogApiGo/logic/search"
	"github.com/gin-gonic/gin"
)

func SearchBlog(ctx *gin.Context) {
	_,_ = search.SearchAllBlog(nil)
	//log.Fatal("SearchAllBlog")
}
