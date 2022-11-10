import {get,post} from "./http"

export const getArticleById = (p) => get("/blog/article/get", p)
