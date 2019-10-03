<template>
  <div class="regWrap">
    <h4 class="regTitle">
      <img src="../assets/logo_big.png" />
      因呼吸而存在
    </h4>
    <input class="inputStyle" placeholder="您的用户名是..." />
    <input class="inputStyle" type="password" placeholder="您的密码是..." />
    <input class="inputStyle" type="password" placeholder="请确认您的密码" />
    <label class="agreement">
      <input type="checkbox" />同意本站的
      <a href="javascript:;" @click="showPop" >相关条约</a>
      <mt-popup v-model="popupVisible"  popup-transition="popup-fade">
        <div class="popUpInfo">
          1.一人只能申请一个账号,且不可租借转让. <br>
          2.凡注册为本站用户,不可转卖本站商品. <br>
          3.用户上传的任何个人信息,政府有权查看 <br> 
        </div>
      </mt-popup>
    </label>
    <mt-button class="regBtn" type="primary">注册</mt-button>
    <router-link to="/"><mt-button class="regBtn" plain type="primary">已有账号</mt-button></router-link>
  </div>
</template>
<script>
export default {
  data(){
    return{
      popupVisible:false
    }
  },
  methods:{
    showPop(){
      this.popupVisible=!this.popupVisible;
    }
  }
}
</script>
<style scoped>
.regWrap {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.regTitle {
  font-weight: normal;
  margin-top: 30%;
}
/* 弹出信息 */
.popUpInfo{
  margin: 0 auto;
  width:300px;
  height:105px;
  line-height: 35px;
  background:#fff;
  border-radius: 20px;
  padding:10px;
}
.mint-popup{
  border-radius: 20px;
}
.inputStyle {
  width: 270px;
  border: none;
  outline: none;
  border-bottom: 1px solid #00aaef;
  font-size: 18px;
  padding-left: 10px;
  padding-bottom: 5px;
  margin: 10px 0 10px 0;
}
.agreement {
  align-self: flex-start;
  margin-left: 65px;
}
.regBtn {
  width: 286px;
  height: 39px;
  margin-top: 26px;
}
</style>