<template>
  <div>
    <porductloader :type="this.gasType" v-if="refresh" :refresh="refresh"></porductloader>
  </div>
</template>
<script>
import PorductLoader from "./PorductLoader.vue";
export default {
  data(){
    return{
      gasType:0,
    }
  },
  props:['refresh'],
  created(){
    //将类型从airtype传入此主键
    // this.bus.$on("typeSearch", this.changeType.bind(this));
  },
  methods: {
    changeType(gasType) {
      this.gasType = gasType;
      console.log(this.gasType,"search")
    },
  },
  components:{
    porductloader:PorductLoader
  }
}
</script>
