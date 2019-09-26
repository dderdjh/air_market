<template>
  <div class="pageWrap" id="pageWrap">
    <div class="meWrap">

      <div class="bakcGround">
        <img src="../assets/level1.png" class="level" />
        <img src="../assets/config.png" class="config" />
      </div>
      <div class="avatar">
        <img src="../assets/avatar/i5.png" />
      </div>
      <div class="info">
        <span>账号: tom@tom.tom</span>
        <span>主箱号码: A9023</span>
        <span>剩余置换量: 100立方</span>
        <div id="chart" ref="chart" style=" height: 200px;"></div>
      </div>
    </div>
  </div>
</template>
<script>
import echarts from 'echarts';
// import echarts from 'echarts/lib/echarts'; // 引入基本模板
// import bar from 'echarts/lib/chart/bar';   // 引入柱状图组件

export default {
  data() {
    return {
      myChart: null
    };
  },
  mounted() {
    this.myChart = echarts.init(this.$refs.chart);
    this.myChart.setOption({
      title: {
        text: "气体购买统计"
      },
      tooltip: {}, 
      xAxis: {
        data: ["氧气", "古空气", "毒气", "其他气体"]
      },
      yAxis: {},
      series: [
        {
          name: "销量",
          type: "bar",
          data: [5, 10, 36, 10],
          color: "#b992e0"
        }
      ]
    });
    
    var resize = {
        width: `${window.innerWidth*0.9}`,
    };
    this.myChart.resize(resize);
  },
  methods: {}
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
  /* background-color: #35a4c0; */
  background: linear-gradient(135deg, #a6deea, #0085a7) left center/200% 200%;
  border-radius: 50%;
  border: 5px solid #fff;
  padding: 10px;
  position: fixed;
  top: 106px;
  z-index: 10;
  animation: move 5s infinite;
}
.avatar img {
  width: 80px;
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -40px;
  margin-left: -40px;
}
/* .bakcGround {
  position: fixed;
  width: 100%;
  height: 200px;
  background: #2193b0; 
  background: linear-gradient(
    to bottom,
    #6dd5ed,
    #2193b0
  ); 
  border-radius: 0 0 10px 10px;
  z-index: 10;
} */
.bakcGround {
  position: fixed;
  width: 100%;
  height: 200px;
  z-index: 10;
  border-radius: 0 0 10px 10px;
  /* background: #2193b0; */
  background: linear-gradient(135deg, #a6deea, #0085a7) left center/400% 400%;
  animation: move 5s infinite;
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
.level {
  position: absolute;
  right: 10px;
  top: 10px;
}

.config {
  position: absolute;
  right: 10px;
  bottom: 5px;
}
.info {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  position: absolute;
  top: 207px;
  width: 96%;
  height: auto;
  border-radius: 10px;
  background: #4cb4ce30;
}
.info span {
  width: 92%;
  height: 60px;
  text-align: center;
  line-height: 60px;
  display: block;
  font-weight: bold;
  font-size: 17px;
  border: 1px solid #00aaef;
  border-radius: 5px;
  margin: 10px;
}
.info span:last-child{
  position: relative;
}
 
</style>