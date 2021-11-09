import { createRouter, createWebHistory } from 'vue-router'
import {loadView} from "../utils/importUtil";

const routes = [
  {
    path: '/',
    name: 'Index',
    component: loadView("Index")
  }, {
    path: '/article',
    name: 'article',
    component: loadView("article/Article")
  }, {
    path: '/search',
    name: 'Search',
    component: loadView("search/Search")
  }, {
    path: '/friendLink',
    name: 'FriendLink',
    component: loadView("friendLink/FriendLink")
  }, {
    path: '/forum/post',//以“/”开头的嵌套路径会被当作根路径，所以子路由上不用加“/”;在生成路由时，主路由上的path会被自动添加到子路由之前，所以子路由上的path不用在重新声明主路由上的path了。
    name: 'Post',
    component: loadView("forum/Post")
  },{
    path: '/forum',
    name: 'Forum',
    component: loadView("forum/Forum")
  },{
    path: '/login',
    name: 'Login',
    component: loadView("common/Login")
  }

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
