import {get,post} from "./http"

export const getIndexApi = () => get("/blog/index/")

export const getIndexExtApi = () => get("/blog/index/ext")

export const getArticleById = (p) => get("/blog/article/get", p)
