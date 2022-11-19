// 调用user服务api
import {get,post} from "./http"

export const postRegisterApi = (p) => post("/user/info/register",p)

export const postLoginApi = (p) => post("/user/info/login",p)

export const getCommentApi = (p) => get("/user/comment/get", p)

export const saveCommentApi = (p) => post("/user/comment/save", p)

export const addCommentHeatApi = (p) => get("/user/comment/addHeat", p)

export const deleteCommentHeatApi = (p) => get("/user/comment/deleteHeat", p)

export const deleteCommentApi = (p) => get("/user/comment/delete", p)


