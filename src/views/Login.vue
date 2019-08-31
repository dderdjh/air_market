<template>
  <div class="login">
    <div class="loginWrap">
      <img src="../assets/logo_big.png">
      <mt-field class="inputStyle" placeholder="请输入用户名"
        @focus.native.capture="showinfo(1)" @blur.native.capture="showinfo(0)"
        v-model="uname"
      ></mt-field>
      <span class="msgStyle" :class="[isActive==1?'showInfo':'']" >6~20位字母与数字</span>
      <mt-field class="inputStyle" type="password" placeholder="请输入密码"
        @focus.native.capture="showinfo(2)" @blur.native.capture="showinfo(0)"
        v-model="upwd"
      ></mt-field>
      <span class="msgStyle" :class="[isActive==2?'showInfo':'']">6~12位字母与数字</span>
      <mt-button class="loginBtn"  plain type="primary" @click="login">登录</mt-button>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      isActive:0,
      uname:0,
      upwd:0,
    }
  },
  methods:{
    login(){
      //判断用户名密码格式
      let uname = this.uname;
      let upwd = this.upwd;
      let regName = /^[0-9a-z]{6,20}$/i;
      let regPwd = /^[0-9a-z]{6,12}$/i;
    },
    showinfo(n){
      n==1?this.isActive=n:this.isActive=2;
    }
  },
}
</script>
<style >
  .login{
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .login .loginWrap {
    display: flex;
    width: 270px;
    flex-direction: column;
    align-items: center;
    margin-top: 50%;
  }
  .login .inputStyle {
    width: 270px;
    border-bottom: 1px solid #00aaef;
  }
  .login .loginBtn{
    width: 270px;
    margin-top: 28px;
  }
  .login .mint-button--primary.is-plain {
    border: 1px solid #00aaef;
    color: #00aaef;
  }
  .login .mint-cell.mint-field.inputStyle.is-nolabel .mint-cell-wrapper{
    background-size: 120% 0px;
  }
  .login .msgStyle{
    color: #00aaef;
    font-size: 14px;
    opacity: 0;
  }
  /* 动态添加的样式 */
  .showInfo {
    opacity: 1 !important;
  }
</style>
