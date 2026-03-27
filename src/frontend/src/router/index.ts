import { createRouter, createWebHistory } from 'vue-router'
import UserCreate from '../views/UserCreate.vue'
import UserList from '../views/UserList.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      redirect: '/list'
    },
    {
      path: '/create',
      name: 'create',
      component: UserCreate
    },
    {
      path: '/list',
      name: 'list',
      component: UserList
    }
  ],
})

export default router
