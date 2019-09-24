<template>
  <div class="productWrap">
    <div class="product">
      <div class="porductImageWrap">
        <img src="../assets/img/air.jpg" class="porductImage" />
      </div>
      <h2>中级氧气</h2>
      <h3>满足日常需求,同时加强吸入时的享受</h3>
      <h3 class="productPrice">300 兑换量</h3>
      <div class="btns">
        <div class="cartBtn">加入购物车</div>
        <div class="BuyBtn">立即购入</div>
      </div>
      <h4 class="description">商品介绍 :
        <p>中级氧气,无添加营养成分,加强吸入体验.是很好的廉价上瘾气体</p>
      </h4>
    </div>
  </div>
</template>
<style scoped>
.productWrap {
  display: flex;
  flex-direction: column;
  padding: 10px;
  background: #39a8c317;
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
  color:white;
  font-size: 1.2rem;
  line-height: 40px;
  text-align: center;
  padding: 3px;
}
.cartBtn {
  width: 100px;
  border-radius: 10px 0 0 10px;
  background: linear-gradient(-90deg, #2193b0, #c26dd2a8);
}
.productPrice{
  display: inline-block;
  font-size: 1.5rem;
  margin: 9px 0 0 30px;
  color:#0085a7;
}
.description{
  margin-top: 30px;
}
</style>