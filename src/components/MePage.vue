<template>
  <div class="pageWrap">
    <div class="meWrap">
      <div class="bakcGround">
        <img src="../assets/level2.png" class="level" />
      </div>
      <div class="avatar">
        <img src="../assets/avatar/i5.png" />
      </div>
      <div class="info">
        <span>账号: tom@tom.tom</span>
        <span>主箱号码: A9023</span>
        <span>剩余置换量: 100立方</span>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      melist: [1,2,4],
    };
  }
};
</script>
<style scoped>
.meWrap {
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
}
.avatar {
  box-sizing: border-box;
  width: 120px;
  height: 120px;
  background-color: #35a4c0;
  border-radius: 50%;
  border: 5px solid #fff;
  padding: 10px;
  position: fixed;
  top: 106px;
  z-index: 10;
}
.avatar img {
  width: 80px;
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -40px;
  margin-left: -40px;
}
.bakcGround {
  position: fixed;
  width: 100%;
  height: 200px;
  background: #2193b0; /* fallback for old browsers */
  background: linear-gradient(
    to bottom,
    #6dd5ed,
    #2193b0
  ); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
  border-radius: 0 0 10px 10px;
  z-index: 10;
}
.level {
  position: absolute;
  right: 10px;
  top: 10px;
}
.info {
  display: flex;
  flex-direction: column;
  justify-content:flex-start;
  align-items: center;
  position: absolute;
  top: 207px;
  width: 96%;
  height: auto;
  border-radius: 10px 10px 0 0;
  background: #ccc;
}
.info span{
  width: 92%;
  height: 60px;
  text-align: center;
  line-height: 60px;
  display: block;
  font-weight: bold;
  font-size: 17px;
  border: 2px solid #00aaef;
  border-radius: 5px;
  margin: 10px;
}
</style>