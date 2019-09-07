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
        <mt-popup v-model="popupVisible" position="right">.有2</mt-popup>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      melist: [],
      popupVisible: false
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
  position: absolute;
  top: 207px;
  width: 96%;
  height: 300px;
  border-radius: 10px 10px 0 0;
  background: #ccc;
}
</style>