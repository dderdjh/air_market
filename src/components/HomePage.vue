<template>
  <div>
    <airtype></airtype>
    
  </div>
</template>
<script>
// 引入组件
import AirType from "./AirType.vue";
export default {
  data(){
    return{
      list:[],
      pno:0
    }
  },
  components: {
    airtype: AirType
  },
  methods: {
    
    
  }
};
</script>
