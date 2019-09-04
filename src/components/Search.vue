<template>
  <div>
    <div class="searchBar">
      <input class="searchInput" type="text" placeholder="搜索">
      <img src="../assets/search.png" >
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      value:"",
    }
  },
}
</script>

<style scoped>
  .searchBar{
    display: flex;
    justify-content: space-between;
    padding: 10px;
  }
  .searchInput{
    width: 90%;
    padding-left: 5px;
    outline: 0;
    border-top:0; 
    border-radius: 0; 
    
  }
</style>