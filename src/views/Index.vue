<template>
  <div>
    <!-- search bar -->
    <search></search>
    <!-- 设置52px的高度 -->
    <div style="margin-top:52px;"></div>
    <mt-tab-container class="page-tabbar-container" v-model="active">
      <mt-tab-container-item></mt-tab-container-item>
      <mt-tab-container-item></mt-tab-container-item>
      <mt-tab-container-item></mt-tab-container-item>
      <mt-tab-container-item></mt-tab-container-item>
      <mt-tab-container-item></mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>
<script>
//引入组件
import Search from "../components/Search.vue";
export default {
  components:{
    search:Search,
  }
}
</script>