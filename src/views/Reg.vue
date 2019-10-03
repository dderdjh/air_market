<template>
  <div class="regWrap">
    <h4 class="regTitle">
      <img src="../assets/logo_big.png" />
      因呼吸而存在
    </h4>
    <input
      class="inputStyle"
      placeholder="您的用户名是..."
    >
    <input
      class="inputStyle"
      type="password"
      placeholder="您的密码是..."
    >
    <input
      class="inputStyle"
      type="password"
      placeholder="请确认您的密码"
    >
  </div>
</template>
<style scoped>
  .regWrap{
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .regTitle{
    font-weight: normal;
  }
  .inputStyle{
    border:none;
    outline: none;
    border-bottom: 1px solid #00aaef;
  }
</style>