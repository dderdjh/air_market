<template>
  <div class="login">
    <div class="loginWrap">
      <img src="../assets/logo_big.png" />
      <mt-field
        class="inputStyle"
        placeholder="请输入用户名"
        @focus.native.capture="showinfo(1)"
        @blur.native.capture="showinfo(0)"
        v-model="uname"
        :class="[errorN==1?'loginErrorStyle':'']"
      ></mt-field>
      <span class="msgStyle" :class="[isActive==1?'loginShowInfo':'']">合法的 邮箱地址 或 公民编号</span>
      <mt-field
        class="inputStyle"
        type="password"
        placeholder="请输入密码"
        @focus.native.capture="showinfo(2)"
        @blur.native.capture="showinfo(0)"
        v-model="upwd"
        :class="[errorP==2?'loginErrorStyle':'']"
      ></mt-field>
      <span class="msgStyle" :class="[isActive==2?'loginShowInfo':'']">6~12位字母与数字</span>
      <mt-button class="loginBtn" plain type="primary" @click="login">登录</mt-button>
      <mt-button class="loginBtn" plain type="primary" @click="reg">注册</mt-button>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      isActive: 0,
      actived: 0,
      errorN: 0,
      errorP: 0,
      uname: "",
      upwd: "",
      canClick: true
    };
  },
  methods: {
    reg() {
      //点击注册按钮跳转到注册页
      this.$router.push("/Reg");
    },
    login() {
      let uname = this.uname;
      let upwd = this.upwd;

      //判断用户名密码是否为空
      if (uname == "") {
        this.$toast({
          message: "用户名空着呢",
          position: "bottom"
        });
        return;
      }
      if (upwd == "") {
        this.$toast({
          message: "密码空着呢",
          position: "bottom"
        });
        return;
      }

      //发送ajax
      var url = "login";
      var obj = {
        uname,
        upwd
      };
      if (this.canClick) {//节流
        this.canClick = false;
        this.axios(url, { params: obj }).then(res => {
          this.canClick = true;
          var code = res.data.code;
          if (code == -1) {
            this.$toast("用户名或密码错误");
          } else {
            this.$router.push("/Index");
          }
        });
      }
    },
    showinfo(n) {
      let regName = /^^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/i;
      let regName2 = /^1[3456789]\d{9}$/;
      let regPwd = /^[0-9a-z]{6,12}$/i;
      this.isActive = n;
      if (n == 1) {
        this.actived = 1;
      } else if (n == 2) {
        this.actived = 2;
      }
      // console.log(this.isActive, this.actived);
      //判断用户名密码格式
      if (n == 0) {
        switch (this.actived) {
          case 1:
            if (
              this.uname !== "" &&
              !(regName.test(this.uname) || regName2.test(this.uname))
            ) {
              this.$toast({
                message: "用户名格式不正确",
                position: "bottom"
              });
              this.errorN = 1;
              return;
            } else if (this.uname !== "") {
              this.errorN = 0;
            }
          case 2:
            if (this.upwd !== "" && !regPwd.test(this.upwd)) {
              this.$toast({
                message: "密码格式不正确",
                position: "bottom"
              });
              this.errorP = 2;
              return;
            } else if (this.upwd !== "") {
              this.errorP = 0;
            }
        }
      }
    }
  }
};
</script>
<style >
.login {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.login .loginWrap {
  display: flex;
  width: 270px;
  flex-direction: column;
  align-items: center;
  margin-top: 40%;
}
.login .inputStyle {
  width: 270px;
  border-bottom: 1px solid #00aaef;
}
.login .loginBtn {
  width: 270px;
  margin-top: 28px;
}
.login .mint-button--primary.is-plain {
  border: 1px solid #00aaef;
  color: #00aaef;
}
.login .mint-cell.mint-field.inputStyle.is-nolabel .mint-cell-wrapper {
  background-size: 120% 0px;
}
.login .msgStyle {
  color: #00aaef;
  font-size: 14px;
  opacity: 0;
}
/* 动态添加的样式 */
.loginShowInfo {
  opacity: 1 !important;
}
.loginErrorStyle {
  border-bottom: 2px solid #ff0000b0 !important;
}
</style>
