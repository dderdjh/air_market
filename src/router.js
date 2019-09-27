import Vue from "vue"
import Router from "vue-router"
//登录页
import Login from "./views/Login.vue"
//注册页
import Reg from "./views/Reg.vue"
//主页
import Index from "./views/Index.vue"

///==========组件测试
<<<<<<< HEAD
// import AirType from "./components/AirType.vue"
=======
import CartPage from "./components/CartPage.vue"
>>>>>>> 72c79343eeb66f1b6bfb7bc0ab3210a5f95ee05d


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
<<<<<<< HEAD
    
=======
    {
      path: "/CartPage",
      name: "CartPage",
      component: CartPage,
      
    }
>>>>>>> 72c79343eeb66f1b6bfb7bc0ab3210a5f95ee05d
  ],
  

})
