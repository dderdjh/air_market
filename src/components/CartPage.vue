<template>
  <div class="cartWrap">
    <div class="cartHeader">
      <div>编辑商品</div>
    </div>
    <div style="margin-bottom:60px;"></div>
    <div class="cartItem" v-for="(item,index) of list" :key="index">
      <img class="cartItemImg" :src="item.img_url" />
      <p class="cartTitle">{{item.title}}</p>
      <p class="cartPrice">{{item.price}} 兑换量</p>
      <div class="cartCounter">
        <div class="counterBtn">
          <img src="../assets/jia.png" />
        </div>
        <span class="counterNum">{{item.amount}}</span>
        <div class="counterBtn">
          <img src="../assets/jian.png" />
        </div>
      </div>
      <img class="delBtn" src="../assets/del.png" >
    </div>
    <div style="margin-top:55px;"></div>
    <div class="cartFooter">
      <div class="leftH"></div>
      <div class="rightH"></div>
      <span class="chooseAllTxt">全选</span>
      <div class="buyBtn">立 即 兑 换</div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      list:[]
    }
  },
  created(){
    console.log("cart load");
    this.loadCart();
  },
  methods: {
    //显示购物车商品
    loadCart(){
      var url = "loadCart";
      this.axios.get(url)
      .then(res=>{
        if(res.data.code == 1){
          var rows = res.data.data;
          this.list = rows;
        }
      });
    }
  },
}
</script>
<style scoped>
/* header */
.cartHeader {
  width: 100%;
  height: 50px;
  display: flex;
  justify-content: flex-end;
  position: fixed;
  top: 0;
  background: linear-gradient(90deg, #e1f5fb, #ebf8ff);
  z-index: 1;
  margin-bottom: 50px;
  border:0px;
}
.cartHeader div {
  width: 100px;
  height: 50px;
  line-height: 50px;
  text-align: center;
  font-size: 19px;
}
/* cart item */
.cartItem {
  height: 100px;
  box-shadow: 0px 0px 5px 0px #c26dd2a8;
  border-radius: 10px;
  margin: 10px;
  position: relative;
}
.cartItemImg {
  width: 90px;
  height: 70px;
  border-radius: 10px;
  position: absolute;
  top: 15px;
  left: 10px;
}
.cartTitle {
  position: absolute;
  left: 30%;
  top: 5%;
  font-size: 18px;
}
.cartCounter {
  width: 32px;
  height: 88px;
  display: flex;
  justify-content: space-between;
  flex-direction: column;
  align-items: center;
  position: absolute;
  top: 10%;
  left: 80%;
}
.counterBtn img {
  width: 16px;
}
.cartPrice {
  width: 120px;
  font-weight: bold;
  color: #00aaef;
  font-size: 18px;
  position: absolute;
  left: 49%;
  top: 38%;
}
.delBtn{
  width: 22px;
  position: absolute;
  top: 50%;
  right: 10px;
  margin-top: -11px;
  
}
/* footer */
.cartFooter {
  width: 100%;
  height: 50px;
  background: linear-gradient(-90deg, #e1f5fb, #ebf8ff);
  line-height: 50px;
  position: fixed;
  bottom: 58px;
}
.buyBtn {
  width: 120px;
  height: 30px;
  text-align: center;
  background: linear-gradient(-90deg, #2193b0, #c26dd2a8);
  box-shadow: 0px 0px 10px 0px #c26dd2a8;
  font-weight: bold;
  line-height: 30px;
  border-radius: 30px;
  padding: 6px;
  position: absolute;
  top:4px;
  right:20px;
}
.leftH,.rightH{
  width:13px;
  height: 26px;
  /* border: 1px solid gray; */
  border-radius: 26px 0 0 26px;
  border-right:0;
  position: absolute;
  
}
.leftH{
  background-color:#2193b0;
  transform: rotate(300deg);
  top:14px;
  left: 27px;
  box-shadow: -3px 0px 16px 0px #b3b3b3;
}
.rightH{
  border-radius: 0 26px 26px 0;
  /* border-right: 1px solid gray; */
  /* border-left: 0; */
  top:2px;
  left: 34px;
  background-color:#2193b0;
  transform: rotate(300deg);
  box-shadow: 3px 0px 16px 0px #b3b3b3;
}
.chooseAllTxt{
  position: absolute;
  top:0;
  left: 65px;
  font-weight: bold;
  font-size: 18px;
}
</style>