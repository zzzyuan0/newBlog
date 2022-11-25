import {ElMessage,ElMessageBox} from "element-plus"
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

    token = token.token_type + token.access_token
    token && (config.headers.Authorization = token)

    return config
},error => {
    console.log(error)
})
//后置拦截
axios.interceptors.response.use(res => {
    res = res.data
    if (res.code >= 400) {
        ElMessage({
            type: 'error',
            message: res.msg + "\n" + res.data,
        })
    }
        return res.data;
    },
    error => {
    let status = error.response.status
        switch (status) {
            case 401:goLogin();break;
            default: ElMessage({
                type: 'error',
                message: error.response.data.msg +
                    "\n" + error.response.data.data,
            })
        }
        return Promise.reject(error)
    }
)

function goLogin() {
    ElMessageBox.confirm(
        '账号未登录，请重新登录',
        'Warning',
        {
            confirmButtonText: '登录',
            cancelButtonText: '取消',
            type: 'warning',
        }
    )
        .then(() => {
            router.push({
                name: 'Login'
            }).then(r => {

            })
        })
        .catch(() => {
            ElMessage({
                type: 'info',
                message: '未登录将无法进行接下来操作',
            })
        })
}

