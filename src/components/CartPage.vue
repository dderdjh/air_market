<template>
  <div class="cartWrap">
    <div class="cartHeader">
      <div>编辑商品</div>
    </div>
    <div class="cartItem">
      <img class="cartItemImg" src="../assets/img/air.jpg" >
      <p class="cartTitle">高级空气的频繁</p>
      <p class="cartPrice">300019 兑换量</p>
      <div class="cartCounter">
        <div class="counterBtn">
          <img src="../assets/jia.png" >
        </div>
        <span class="counterNum">46</span>
        <div class="counterBtn">
          <img src="../assets/jian.png" >
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
  .cartHeader{
    width: 100%;
    height: 50px;
    border-bottom: 1px solid #d0d0d0;
    display: flex;
    justify-content:flex-end;
  }
  .cartHeader div{
    width:100px;
    height: 50px;
    line-height: 50px;
    text-align: center;
    font-size: 19px;
  }
  .cartItem{
    height: 100px;
    /* border: 1px solid blue; */
    box-shadow: 0px 0px 5px 0px #c26dd2a8;
    border-radius: 10px;
    margin:10px;
    position: relative;
  }
  .cartItemImg{
    width: 90px;
    height: 70px;
    border-radius: 10px;
    position: absolute;
    top: 15px;
    left: 10px;
  }
  .cartTitle{
    position: absolute;
    left: 30%;
    top: 5%;
    font-size: 18px;
  }
  .cartCounter{
    width:32px;
    height: 88px;
    display: flex;
    justify-content: space-between;
    flex-direction: column;
    align-items: center;
    position: absolute;
    top: 10%;
    left:84%;
  }
  .counterBtn img{
    width:16px;
  }
  .cartPrice{
    width:120px;
    font-weight: bold;
    color: #00aaef;
    font-size: 18px;
    position: absolute;
    left: 49%;
    top: 38%;
  }
</style>