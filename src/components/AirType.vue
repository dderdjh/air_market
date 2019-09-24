<template>
  <div class="type-wrap">
    <div class="air" @click="typeSearchOxigen">
      <span>氧气</span>
    </div>
    <div class="anti-air" @click="typeSearchOld">
      <span>古空气</span>
    </div>
    <div class="sp-air" @click="typeSearchOther">
      <span>其它气体</span>
    </div>
    <div class="po-air" @click="typeSearchMystery">
      <span>神秘气体</span>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      gasType: 0
    };
  },
  methods: {
    typeSearchOxigen() {
      // this.gasType = 1;
      // this.bus.$emit("typeSearch",this.gasType);
      // this.bus.$emit("goActive");

      this.$store.commit("setType", 1);
        this.bus.$emit("goActive");
    },
    typeSearchOld() {
      // this.gasType = 2;
      // this.bus.$emit("typeSearch",this.gasType);
      // this.bus.$emit("goActive")

      this.$store.commit("setType", 2);
        this.bus.$emit("goActive");
    },
    typeSearchOther() {
      this.$store.commit("setType", 3);

      // this.gasType = 3;
      // this.bus.$emit("typeSearch",this.gasType);
        this.bus.$emit("goActive");
    },
    typeSearchMystery() {
      this.$store.commit("setType", 4);
      // console.log(this.$store.state.type+'search')
      // this.gasType = 4;
      // this.bus.$emit("typeSearch",this.gasType);
        this.bus.$emit("goActive");
    }
  }
};
</script>
<style scoped>
.type-wrap {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
.type-wrap div {
  display: flex;
  justify-content: flex-end;
  align-items: flex-end;
  width: 45%;
  height: 185px;
  margin: 10px;
  background: lightblue;
  border-radius: 36px;
  box-shadow: 0px 0px 10px 4px #70727347;
  transition: background-size 1s;
}
.type-wrap div span {
  width: 33px;
  margin: 0 18px 11px 0;
  color: #212121c9;
  font-size: 33px;
  font-weight: bolder;
  user-select: none;
}

.type-wrap .air:active {
  background-size: 230%;
}
.type-wrap .anti-air:active {
  background-size: 150%;
}
.type-wrap .sp-air:active {
  background-size: 270%;
}
.type-wrap .po-air:active {
  background-size: 150%;
}
.type-wrap .air {
  background: url("../assets/img/air.jpg") no-repeat center center/180%;
}
.type-wrap .anti-air {
  background: url("../assets/img/old.jpg") no-repeat center center/123%;
}
.type-wrap .sp-air {
  background: url("../assets/img/other.jpg") no-repeat center center/210%;
}
.type-wrap .po-air {
  background: url("../assets/img/po.jpg") no-repeat center center/113%;
}
</style>