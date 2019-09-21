<template>
  <div>
    <porductloader ></porductloader>
  </div>
</template>
<script>
import PorductLoader from "./PorductLoader.vue";
export default {
  data(){
    return{
      gasType1:0
    }
  },
  updated(){
    this.bus.$on("typeSearch", this.changeType.bind(this));
  },
  methods: {
    changeType(gasType) {
      this.gasType1 = gasType;
      console.log(this.gasType1)
    },
  },
  components:{
    porductloader:PorductLoader
  }
}
</script>
