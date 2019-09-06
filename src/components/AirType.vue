<template>
  <div class="type-wrap">
    <div class="air">
      <span>氧气</span>
    </div>
    <div class="anti-air">
      <span>古空气</span>
    </div>
    <div class="sp-air">
      <span>其它气体</span>
    </div>
    <div class="po-air">
      <span>毒气</span>
    </div>
  </div>
</template>
<style scoped>
  .type-wrap{
    display: flex;
    flex-wrap: wrap;
  }
  .type-wrap div{
    display: flex;
    justify-content: flex-end;
    align-items:flex-end;
    width: 45%;
    height: 185px;
    margin: 10px;
    background: lightblue;
    border-radius: 36px;
    box-shadow:0px 0px 10px 4px #70727347;
    transition: background-size 1s;
  }
  .type-wrap div span {
    margin: 0 10px 10px 0;
    font-size: 1.5rem;
    font-weight: bolder;
    user-select: none;
  }

  .type-wrap .air:active{
    background-size: 230%
  }
  .type-wrap .anti-air:active{
    background-size: 180%
  }
  .type-wrap .sp-air:active{
    background-size: 300%
  }
  .type-wrap .po-air:active{
    background-size: 220%
  }
  .type-wrap .air{
    background: url("../assets/img/air.jpg") no-repeat center center/180%;
  }
  .type-wrap .anti-air{
    background: url("../assets/img/old.jpg") no-repeat center center/123%;
  }
  .type-wrap .sp-air{
    background: url("../assets/img/other.jpg") no-repeat center center/210%;
  }
  .type-wrap .po-air{
    background: url("../assets/img/po.jpg") no-repeat center center/113%;
  }
</style>