import {ElMessage,ElLoading} from "element-plus"
import {baseUrl} from "./globalConf";
import axios from "axios";

let loadingInstance = null

export const service = axios.create({
    timeout: 7000, // 请求超时时间
    baseURL: baseUrl,
    method: 'post',
    headers: {
        'Content-Type': 'application/json;charset=UTF-8'
    }
})

// 请求拦截器
service.interceptors.request.use(config => {
    loadingInstance = ElLoading.service({
        lock: true,
        text: 'loading....'
    })
    return config
})


// 响应拦截
service.interceptors.response.use( resp => {
    loadingInstance.close()
    return resp.data
}, error => {
    ElMessage({
        message: error,
        type: 'error',
        duration: 3*1000
    })
    loadingInstance.close()
    return Promise.reject(error)
})
