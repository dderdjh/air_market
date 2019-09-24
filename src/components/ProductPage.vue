<template>
  <div class="productWrap">
    <div class="product">
      <div class="porductImageWrap">
        <img src="../assets/img/po.jpg" class="porductImage" />
      </div>
      <h2>中级氧气</h2>
      <h3>满足日常需求,同时加强吸入时的享受</h3>
      <p>300</p>
      <div class="btns">
        <div class="cartBtn">add</div>
        <div class="BuyBtn">buy</div>
      </div>
      <p>中级氧气,无添加营养成分,加强吸入体验.是很好的廉价上瘾气体</p>
    </div>
  </div>
</template>
<style scoped>
.productWrap {
  display: flex;
  flex-direction: column;
  padding: 10px;
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
</style>