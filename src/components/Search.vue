<template>
  <div class="searchBarWrap">
    <div class="searchBar">
      <input class="searchInput" type="text" placeholder="搜索" v-model="value">
      <img src="../assets/cancel.png" class="cancelBtn" @click="cancel" v-if="isShow">
      <img src="../assets/searcha.png" >
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      value:"",
      isShow:false,
    }
  },
  methods: {
    cancel(){
      this.value="";
    }
  },
  watch:{
    value(val){
      console.log(val)
      if(val.length>0){
        this.isShow = true;
      }else{
        this.isShow = false;
      }
    }
  }
}
</script>

<style scoped>
  .searchBarWrap{
    width:100%;
    height: 51px;
    position: fixed;
    overflow: hidden;
    z-index: 9999;
    background: white;
  }
  .searchBar{
    width: 96%;
    height: 32px;
    display: flex;
    justify-content: space-between;
    padding: 10px;
    background-color: #12b1f01e;
    position: fixed;
    z-index: 999;
  }
  .searchInput{
    width: 90%;
    padding-left: 20px;
    padding-right: 42px;
    outline: 0;
    border:0; 
    border-radius: 16px;
    
  }
  .cancelBtn{
    position: absolute;
    top:50%;
    right:57px;
    margin-top:-8px;
  }
</style>