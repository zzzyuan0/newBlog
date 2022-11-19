// 调用第三方服务api
import {get,post} from "./http"

export const getProjectApi = (p) => get("/index/project/pageQuery?" + "page=" + p.page + "&pageSize=" + p.pageSize)

// http://localhost:8880/api/three/sms/captcha?receiveEmail=codesuperman@foxmail.com
export const postSendCaptchaApi = (p) => post("/three/sms/captcha?receiveEmail=" + p)
