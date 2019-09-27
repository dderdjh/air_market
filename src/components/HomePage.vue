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
<<<<<<< HEAD
  methods: {
    loadMore(){
      //功能:当组件创建成功后获取第一页数据
      // 1.创建一个url地址
      var url="gas";
      //1.1.将当前页码加一
      this.pno++;
      var obj = {pno:this.pno};
      // 2.发送afax请求获取第一页数据
      this.axios.get(url,{params:obj}).then(res=>{
      // 3.将数据保存在data中
        // console.log(res.data.data);
        // this.list.concat() = res.data.data;
        var rows = this.list.concat(res.data.data); //页的拼接
        this.list = rows;
      });
    }
  },
 
=======
>>>>>>> 72c79343eeb66f1b6bfb7bc0ab3210a5f95ee05d
};
</script>
