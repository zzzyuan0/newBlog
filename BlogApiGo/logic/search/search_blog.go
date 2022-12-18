package search

import (
	"BlogApiGo/api"
	"BlogApiGo/models"
)

func SearchAllBlog(req *api.SearchBlogReq) (resp *api.SearchBlogResp, err error) {
	models.GetBlogArticle()
	//log.Fatal("SearchAllBlog")
	return resp, err
}

