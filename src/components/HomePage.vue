<template>
  <div>
    <airtype></airtype>
    <porductloader></porductloader>
  </div>
</template>
<script>
// 引入组件
import AirType from "./AirType.vue";
import PorductLoader from "./PorductLoader.vue";
export default {
  data(){
    return{
      
    }
  },
  created(){},
  components: {
    airtype: AirType,
    porductloader: PorductLoader
  },
  methods: {
    
  }
};
</script>
<style scoped>
  .goods{
    width:40%;
    box-sizing: border-box;
    height:auto;
    display: flex;
    flex-direction: column;
    margin:10px;
    border: 1px solid #00aaef;
    border-radius: 5px;
    padding: 5px;
  }
  .goods-img{
    width:100%;
    border-radius: 5px;
  }
</style>