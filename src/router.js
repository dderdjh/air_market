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
import AirTypes from "./components/AirTypes.vue"
=======
import AirType from "./components/AirType.vue"
>>>>>>> 0ab1d72ca84cdad91d0022cecd3f4ed573129d6c


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
<<<<<<< HEAD
      path: "/AirTypes",
      name: "airtypes",
      component: AirTypes
=======
      path: "/AirType",
      name: "airtype",
      component: AirType
>>>>>>> 0ab1d72ca84cdad91d0022cecd3f4ed573129d6c
    }
  ]
})
