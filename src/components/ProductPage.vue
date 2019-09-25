<template>
  <div class="productWrap">
    <div class="product">
      <div class="porductImageWrap">
        <img :src="'http://127.0.0.1:8080/'+this.list[0].img_url" class="porductImage" />
      </div>
      <h2>{{this.list[0].title}}</h2>
      <h3>{{this.list[0].subtitle}}</h3>
      <h3 class="productPrice">{{this.list[0].price}} 兑换量</h3>
      <div class="btns">
        <div class="cartBtn">加入购物车</div>
        <div class="BuyBtn">立即购入</div>
      </div>
      <h4 class="description">
        商品介绍 :
        <p>{{this.list[0].details}}</p>
      </h4>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      gid: 0,
      list:[]
    };
  },
  beforeMount() {},
  created() {
    this.loadProduct();
    console.log("product loadedZ",this.gid);
  },
  methods: {
    loadProduct() {
      this.gid = this.$store.getters.getGid;
      var gid = this.gid;
      var url = "detail";
      var obj={gid};
      //发送请求
      this.axios.get(url,{params:obj})
      .then(res=>{
        //保存返回值
        this.list=res.data.data;
      });
    }
  }
};
</script>
<style scoped>
.productWrap {
  height: 100%;
  display: flex;
  flex-direction: column;
  padding: 10px 10px 32px 10px;
  /* background: #39a8c317; */
}
.porductImageWrap {
  width: 100%;
  height: 400px;
  display: table-cell;
  vertical-align: middle;
}
.porductImage {
  width: 100%;
  box-sizing: border-box;
  vertical-align: middle;
  /* border: 1px dashed #00aaef; */
  border-radius: 10px;
  padding: 7px;
  background: linear-gradient(270deg, #a6deea, #0085a7) left center/300% 300%;
  animation: move 3s infinite;
}
@keyframes move {
  0%,
  100% {
    background-position-x: left;
  }
  50% {
    background-position-x: right;
  }
}

.btns {
  width: 180px;
  display: flex;
  flex-direction: row;
  justify-content: flex-end;
  float: right;
  /* border: 1px solid red; */
}
.cartBtn,
.BuyBtn {
  width: 80px;
  height: 40px;
  background: linear-gradient(90deg, #2193b0, #27b0d0);
  border-radius: 0 10px 10px 0;
  box-shadow: 2px 0px 6px 1px #2193b0;
  color: white;
  font-size: 1.2rem;
  line-height: 40px;
  text-align: center;
  padding: 3px;
}
.cartBtn {
  width: 100px;
  border-radius: 10px 0 0 10px;
  background: linear-gradient(-90deg, #2193b0, #c26dd2a8);
  /* box-shadow: 1px 0px 10px 0px #2193b0; */
  animation: shadow 3s infinite;
}
@keyframes shadow {
  0% {
    box-shadow: 2px 0px 10px 0px #2193b0;
  }
  50% {
    box-shadow: -15px 0px 10px 5px #c26dd2a8;
  }
  100% {
    box-shadow: 2px 0px 10px 0px #2193b0;
  }
}
.productPrice {
  display: inline-block;
  font-size: 1.5rem;
  margin: 9px 0 0 30px;
  color: #0085a7;
}
.description {
  margin-top: 30px;
}
</style>