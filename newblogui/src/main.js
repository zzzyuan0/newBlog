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
import  './conf/axiosConf'

// 引入iconfont
import './assets/less/index.less'
import './assets/iconfont/iconfont.js'

// 引入字体
import './conf/ttfConfig.css'

// 引入markdown編輯器
import MdEditor from 'md-editor-v3';
import 'md-editor-v3/lib/style.css';

const app = createApp(App).use(store).use(router)
app.use(ElementPlus)
app.use(VueAxios, axios)
app.use(MdEditor)


app.mount('#app')
