import {ElMessage,ElLoading} from "element-plus"
import {baseUrl} from "./globalConf";
import axios from "axios";
import store from '../store'
import router from "../router";

axios.defaults.baseURL = baseUrl
axios.defaults.timeout = 10000;

//前置攔截
axios.interceptors.request.use(config => {
    let token = store.getters.getToken
    if (!token) return config
    token = token.tokenType + token.accessToken
    token && (config.headers.Authorization = token)

    return config
},error => {
    console.log(error)
})
//后置拦截
axios.interceptors.response.use(res => {
    res = res.data
    if (res.code >= 400) {
        alert("错误")
    }
        return res.data;
    },
    error => {
        return Promise.reject(error)
    }
)

