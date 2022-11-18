import {get,post} from "./http"

export const getCommentApi = (p) => get("/user/comment/get", p)

export const saveCommentApi = (p) => post("/user/comment/save", p)

export const addCommentHeatApi = (p) => get("/user/comment/addHeat", p)

export const deleteCommentHeatApi = (p) => get("/user/comment/deleteHeat", p)


