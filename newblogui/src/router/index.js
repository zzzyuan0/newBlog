import { createRouter, createWebHistory } from 'vue-router'
import {loadView} from "../utils/importUtil";

const routes = [
  {
    path: '/',
    name: 'index',
    component: loadView("Index")
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
