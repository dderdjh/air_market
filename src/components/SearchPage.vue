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
  created(){
    this.bus.$on("typeSearch", this.changeType.bind(this));
    console.log(this.gasType1)
  },
  methods: {
    changeType(gasType) {
      this.gasType1 = gasType;
    },
  },
  components:{
    porductloader:PorductLoader
  }
}
</script>
