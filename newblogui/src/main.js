import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'


// 引入element-ui
import ElementPlus from "element-plus"
import 'element-plus/dist/index.css'

// 引入axios
import axios from 'axios'
import VueAxios from 'vue-axios'

// 引入axios配置
import {service} from './conf/axiosConf'

// 引入iconfont
import './assets/less/index.less'

// 引入字体
import './conf/ttfConfig.css'

const app = createApp(App).use(store).use(router)
app.use(ElementPlus)
app.use(VueAxios, axios)

app.config.globalProperties.$axios = service

app.mount('#app')
