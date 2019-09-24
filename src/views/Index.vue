<template>
  <div class="pageContainer">
  <div class="pageWrap">
    <!-- search bar -->
    <search v-show="isMe"></search>
    <!-- 设置52px的高度 -->
    <div style="margin-top:52px;" v-show="isMe"></div>
    <mt-tab-container class="page-tabbar-container" v-model="active" >
      <mt-tab-container-item id="search">
        <searchpage :refresh="refresh"></searchpage>
      </mt-tab-container-item>
      <mt-tab-container-item id="product">
        <productpage></productpage>
      </mt-tab-container-item>
      <mt-tab-container-item id="home">
        <homepage></homepage>
      </mt-tab-container-item>
      <mt-tab-container-item id="cart">
        <cartpage></cartpage>
      </mt-tab-container-item>
      <mt-tab-container-item id="me">
        <mepage></mepage>
      </mt-tab-container-item>
    </mt-tab-container>
    <!-- 底部导航 -->
    <mt-tabbar v-model="active" fixed>
      <mt-tab-item id="search" @click.native="changeState(0)">
        <tabbaricon
          :selectedImage="require('../assets/searcha.png')"
          :normalImage="require('../assets/search.png')"
          :focused="currentIndex[0].isSelect"
        ></tabbaricon>
      搜索
      </mt-tab-item>
      <mt-tab-item id="product" @click.native="changeState(1)">
        <tabbaricon
        :selectedImage="require('../assets/proa.png')"
        :normalImage="require('../assets/pro.png')"
        :focused="currentIndex[1].isSelect"
        ></tabbaricon>
      商品
      </mt-tab-item>
      <mt-tab-item id="home" @click.native="changeState(2)">
      <tabbaricon
      :selectedImage="require('../assets/homea.png')"
      :normalImage="require('../assets/home.png')"
      :focused="currentIndex[2].isSelect"
      ></tabbaricon>
      首页
      </mt-tab-item>
      <mt-tab-item id="cart" @click.native="changeState(3)">
      <tabbaricon
      :selectedImage="require('../assets/carta.png')"
      :normalImage="require('../assets/cart.png')"
      :focused="currentIndex[3].isSelect"
      ></tabbaricon>
      购物车
      </mt-tab-item>
      <mt-tab-item id="me" @click.native="changeState(4)">
      <tabbaricon
      :selectedImage="require('../assets/mea.png')"
      :normalImage="require('../assets/me.png')"
      :focused="currentIndex[4].isSelect"
      ></tabbaricon>
      我</mt-tab-item>
    </mt-tabbar>
  </div>
  </div>
</template>
<script>
//引入组件
import Search from "../components/Search.vue";
import TabBarIcon from "../components/TabBarIcon.vue"
import SearchPage from "../components/SearchPage.vue"
import ProductPage from "../components/ProductPage.vue"
import HomePage from "../components/HomePage.vue"
import CartPage from "../components/CartPage.vue"
import MePage from "../components/MePage.vue"
export default {
  data(){
    return{
      active: "home",
      currentIndex:[
        {isSelect:false},
        {isSelect:false},
        {isSelect:true},
        {isSelect:false},
        {isSelect:false},
      ],
      isMe:true,
      refresh:false
    }
  },
  created(){
    this.bus.$on("goActive",this.goActive.bind(this));
  },
  watch:{
    active() {
      if(this.active!='search'){
        this.refresh = false;
      }
      else {
        this.refresh = true;
      }
      console.log('index change refresh reference'+this.refresh)
    }
  },
  methods: {
    //airType点击转换
    goActive(){
      this.active = "search";
      this.currentIndex[0].isSelect = true;
      this.currentIndex[2].isSelect = false;
    },
    changeState(n){
      for(var i=0;i<this.currentIndex.length;i++){
        if(n==i){
          this.currentIndex[i].isSelect=true;
        }else{
          this.currentIndex[i].isSelect=false;
        }
        if(this.currentIndex[4].isSelect){
          this.isMe = false;
        }else{
          this.isMe = true;
        }
      }
    },
    changeRefresh() {
      console.log('come back from search and before this.refresh='+this.refresh)
      this.refresh = false;
      console.log('come back from search and after this.refresh='+this.refresh)
    }
  },
  components:{
    "search":Search,
    "tabbaricon":TabBarIcon,
    "searchpage":SearchPage,
    "productpage":ProductPage,
    "homepage":HomePage,
    "cartpage":CartPage,
    "mepage":MePage


  }
}
</script>
<style scoped>
  .pageContainer{
    overflow: hidden;
  }
  .pageWrap{
    height:100vh;
    overflow:auto;
    padding-bottom: 60px;
  }
</style>