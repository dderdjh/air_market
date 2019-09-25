<template>
  <div class="homeWrap">
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
  created(){
    //初始化气体类型为0
    this.$store.commit("setType",0);
    // console.log(this.$store.getters.getType,"home type");
  },
  components: {
    airtype: AirType,
    porductloader: PorductLoader
  },
};
</script>
