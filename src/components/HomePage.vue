<template>
  <div>
    <airtype></airtype>
    <ul
      v-infinite-scroll="loadMore"
      infinite-scroll-disabled="loading"
      infinite-scroll-distance="10"
    >
      <li v-for="item in list">{{ item }}</li>
    </ul>
  </div>
</template>
<script>
// 引入组件
import AirType from "./AirType.vue";
export default {
  data(){
    return{
      list:["a",2,3,4,5]
    }
  },
  components: {
    airtype: AirType
  },
  methods: {
    loadMore() {
      this.loading = true;
      setTimeout(() => {
        let last = this.list[this.list.length - 1];
        for (let i = 1; i <= 10; i++) {
          this.list.push(last + i);
        }
        this.loading = false;
      }, 2500);
    }
  }
};
</script>
