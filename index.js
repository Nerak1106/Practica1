import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import CrearView from '../components/CrearView.vue'
import ListarView from '../components/ListarView.vue'
import EditarView from '../components/EditarView.vue'
import ExamenesView from '../components/ExamenesView.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/crear',
    name: 'crear',
    component: CrearView
  },
  {
    path: '/listar',
    name: 'lista',
    component: ListarView
  },
  {
    path: '/editar/:id',
    name: 'editar',
    component: EditarView
  },
  {
    path: '/examenes/:id',
    name: 'examenes',
    component: ExamenesView
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router


export default router
