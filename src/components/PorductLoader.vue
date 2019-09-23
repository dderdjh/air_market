<template>
  <div class="goodsWrap">
    <ul
      v-infinite-scroll="loadMore"
      infinite-scroll-disabled="loading"
      infinite-scroll-distance="10"
      class="infin-list"
    >
      <div class="goods" v-for="(item,index) of list" :key="index">
        <!-- 商品图片 -->
        <img class="goods-img" :src="'http://127.0.0.1:8080/'+item.img_url" />
        <!-- 商品名称 -->
        <div class="goods-info">
          <h4 class="goods-title">{{item.title}}</h4>
          <h5 class="goods-subtitle">{{item.subtitle}}</h5>
          <div class="goods-price">消耗: {{item.price}} 兑换量</div>
        </div>
      </div>
    </ul>
  </div>
</template>
<script>
import { watch } from 'fs';
export default {
  data() {
    return {
      list: [],
      pno: 0,
      gasType:[0]
    };
  },
  props:["type"],
  created(){
    // this.loadMore();
    console.log("showed")
  },
  updated() {
    // this.loadMore();
    console.log(this.type,"update");
  },
  methods: {
    loadMore() {
      //功能:当组件创建成功后获取第一页数据
      // 1.创建一个url地址
      if (this.gasType[0] == 0) {
        var url = "gas";
        this.pno++;
        var obj = {
          pno: this.pno
        };
      } else {
        var url = "sreach_gas";
        this.pno++;
        var obj = {
          pno: this.pno,
          gasType: this.gasType[0]
        };
      }
      //1.1.将当前页码加一

      // 2.发送afax请求获取第一页数据
      this.axios.get(url, { params: obj }).then(res => {
        // 3.将数据保存在data中
        // console.log(res.data.data);
        // this.list.concat() = res.data.data;
        var rows = this.list.concat(res.data.data); //页的拼接
        this.list = rows;
      });
    }
  },//methods end
  watch:{
    type(){
      // this.$set(this.gasType,0,this.type)
      this.gasType[0] = this.type;
      console.log(this.gasType[0],"loarder,watch")
    }
  }//watch end
};
</script>
<style scoped>
.goodsWrap {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.infin-list {
  text-decoration: 0;
  margin: 0;
  padding: 0;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
}
.goods {
  width: 47%;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  margin: 5px;
  border: 1px solid #00aaef;
  border-radius: 5px;
  padding: 5px;
  background: #39a8c317;
}
.goods-img {
  width: 100%;
  border-radius: 5px;
}
.goods-info {
  font-weight: bold;
}
</style>