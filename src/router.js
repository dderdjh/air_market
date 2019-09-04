import Vue from "vue"
import Router from "vue-router"
//登录页
import Login from "./views/Login.vue"
//注册页
import Reg from "./views/Reg.vue"




Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'login',
      component: Login
    },
    {
      path: "/Reg",
      name: "Reg",
      component: Reg
    }
  ]
})
