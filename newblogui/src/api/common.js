import {get,post} from "./http"
// http://localhost:8880/api/user/info/register
export const postRegisterApi = (p) => post("/user/info/register",p)

// http://localhost:8880/api/user/info/login
export const postLoginApi = (p) => post("/user/info/login",p)
