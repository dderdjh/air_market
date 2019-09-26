import Vue from "vue"
import Router from "vue-router"
//登录页
import Login from "./views/Login.vue"
//注册页
import Reg from "./views/Reg.vue"
//主页
import Index from "./views/Index.vue"

///==========组件测试
import CartPage from "./components/CartPage.vue"


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
      name: "reg",
      component: Reg
    },
    {
      path: "/Index",
      name: "index",
      component: Index
    },
    {
      path: "/CartPage",
      name: "CartPage",
      component: CartPage,
      
    }
  ],
  
})
