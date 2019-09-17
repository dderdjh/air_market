<template>
  <div>
    <airtype></airtype>
    <div class="goods" v-for="(item,index) of list" :key="index">
      <!-- 商品图片 -->
      <img :src="'http://127.0.0.1:8080/'+item.img_url" >
      <!-- 商品名称 -->
      <h5>{{item.title}}</h5>
      <h6>{{item.subtitle}}</h6>
      <div>{{item.price}}</div>
    </div>
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
  created(){
    this.loadMore();
  },
  components: {
    airtype: AirType
  },
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
  }
};
</script>
