<template>
  <div>
    <img :src="focused?selectedImage:normalImage" class="imgStyle">
  </div>
</template>
<script>
export default {
  props:{
    focused:false,
    selectedImage:{default:""},
    normalImage:{defaultl:""}
  }
}
</script>
<style scoped>
  .imgStyle{
    width:30px;
    height:30px;
  }
</style>