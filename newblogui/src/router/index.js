import { createRouter, createWebHistory } from 'vue-router'
import {loadView} from "../utils/importUtil";

const routes = [
  {
    path: '/',
    name: 'Index',
    component: loadView("Index")
  }, {
    path: '/article',
    name: 'Article',
    component: loadView("Article/Article")
  }, {
    path: '/search',
    name: 'Search',
    component: loadView("Search/Search")
  }, {
    path: '/friendLink',
    name: 'FriendLink',
    component: loadView("FriendLink/FriendLink")
  }, {
    path: '/forum/post',//以“/”开头的嵌套路径会被当作根路径，所以子路由上不用加“/”;在生成路由时，主路由上的path会被自动添加到子路由之前，所以子路由上的path不用在重新声明主路由上的path了。
    name: 'Post',
    component: loadView("Forum/Post")
  },{
    path: '/forum',
    name: 'Forum',
    component: loadView("Forum/Forum"),
    children: [
      // {
      //   // path: 'post',//以“/”开头的嵌套路径会被当作根路径，所以子路由上不用加“/”;在生成路由时，主路由上的path会被自动添加到子路由之前，所以子路由上的path不用在重新声明主路由上的path了。
      //   // name: 'Post',
      //   // component: loadView("Forum/Post")
      // }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
