<template>
  <div class="cartWrap">
    <div class="cartHeader">
      <div>编辑商品</div>
    </div>
    <div class="cartMask" v-if="mask">
      <img src="../assets/cartmarsk.png" class="cmaskImg" />
      <div class="cmaskInfo">
        <p>快 向 购 物 车 里</p>
        <p>加 入 商 品</p>
        <p>吧</p>
      </div>
    </div>
    <div style="margin-bottom:60px;"></div>
    <div class="cartItem" v-for="(item,index) of list" :key="index" >
      <img class="cartItemImg" :src="item.img_url" @click="chooseItem" :data-ischecked="item.isChecked" :data-cid="item.cid"/>
      <img src="../assets/checked.png" class="checkedIcon" v-show="item.isChecked==1?true:false" >
      <p class="cartTitle">{{item.title}}</p>
      <p class="cartPrice">{{item.price*item.amount + " 兑换量"}}</p>
      <div class="cartCounter">
        <div
          class="counterBtn"
          @click="changeAmount($event,1)"
          :data-cid="item.cid"
          :data-amount="item.amount"
        >
          <img src="../assets/jia.png" />
        </div>
        <span class="counterNum">{{item.amount}}</span>
        <div
          class="counterBtn"
          @click="changeAmount($event,-1)"
          :data-cid="item.cid"
          :data-amount="item.amount"
        >
          <img src="../assets/jian.png" />
        </div>
      </div>
      <img class="delBtn" src="../assets/del.png" @click="delCart" :data-cid="item.cid" />
    </div>
    <div style="margin-top:55px;"></div>
    <div class="cartFooter">
      <label @click="activeAllSelect">
        <div class="leftH" :class="{'selectStyle':selectOnL}"></div>
        <div class="rightH" :class="{'selectStyle':selectOnR}"></div>
        <span class="chooseAllTxt">全选</span>
      </label>
      <div class="buyBtn">立 即 兑 换</div>
    </div>
    <div class="cartTotal">
      <span>{{this.totalPrice==0?"请点击图片选中商品":`总量: ${this.totalPrice}`}}</span>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      list: [],
      mask: false,
      totalPrice:0,
      allSelect: false,
      selectOnL:false,
      selectOnR:false
    }; 
  },
  updated() {
    this.calTotal();
    this.isSelected();
  },
  created() {
    console.log("cart load");
    this.loadCart();
  },
  methods: {
    //全选功能
    activeAllSelect(){
      var allSelect = this.allSelect;
      var url = "allSelect";
      var obj ={allSelect};
      this.axios.get(url,{params:obj})
      .then(res=>{
        this.loadCart();
      });
    },
    //检测全选
    isSelected(){
      var itemSelected = 0;
      for(var i = 0;i<this.list.length;i++){
        if(this.list[i].isChecked ==1){
          itemSelected++;
        }
      }//for end 
      if(itemSelected < this.list.length && itemSelected > 0){
        this.selectOnL = true;
        this.selectOnR = false;
        // console.log("至少有一个选中");
        this.allSelect = false;
      }else if(itemSelected==this.list.length){
        this.selectOnL = true;
        this.selectOnR = true;
        // console.log("全部选中");
        this.allSelect = true;
      }else{
        this.selectOnL = false;
        this.selectOnR = false;
        // console.log("没有东西选中");
        this.allSelect = false;
      }
    },
    //结算总价
    calTotal(){
      var totalPrice = 0;
      for(var i=0;i<this.list.length;i++){
        if(this.list[i].isChecked == 1){
          totalPrice +=  this.list[i].amount * this.list[i].price;
        }
      }
      this.totalPrice = totalPrice;
    },
    //选中商品
    chooseItem(event){
      var isChecked = event.target.dataset.ischecked;
      var cid = event.target.dataset.cid;
      var amount = event.target.dataset.amount;
      isChecked==0?isChecked=1:isChecked=0; //判断商品是否已经被选中
      var url = "checked";
      var obj={
        cid,
        isChecked
      }
      this.axios.get(url,{params:obj})
      .then(res=>{
        this.loadCart();
      });
    },
    //改变数量数量
    changeAmount(event, difference) {
      var amount = event.currentTarget.dataset.amount;
      if (amount <= 1 && difference == -1) {
        this.$messagebox({
          message: "商品不能少于一件,请点击删除键删除商品"
        });
        return;
      } else if (amount >= 99 && difference == 1) {
        this.$messagebox({
          message: "最多一次性购买99单位"
        });
        return;
      }
      var cid = event.currentTarget.dataset.cid;
      var url = "changeAmount";
      var obj = {
        difference,
        cid
      };
      this.axios.get(url, { params: obj }).then(res => {
        this.loadCart();
      });
    },
    //删除指定商品
    delCart(event) {
      //询问是否删除
      var cid = event.currentTarget.dataset.cid;
      this.$messagebox
        .confirm("确定删除么?")
        .then(res => {
          var url = "delCart";
          var obj = { cid };
          this.axios.get(url, { params: obj }).then(res => {
            if (res.data.code == 1) {
              this.$toast({
                message: "删 除 成 功",
                duration: 1000
              });
              this.loadCart();
            } else if (res.data.code == -1) {
              this.$toast({
                message: "删 除 失 败",
                duration: 1000
              });
            }
          }); //删除end
        })
        .catch(res => {}); //询问end
    },
    //显示购物车商品
    loadCart() {
      var url = "loadCart";
      this.axios.get(url).then(res => {
        if (res.data.code == 1) {
          var rows = res.data.data;
          this.list = rows;
        } else if (res.data.code == -1) {
          this.mask = true;
        }
      });
    }
  },//nethods end
};
</script>
<style scoped>
/* mask */
.cartMask {
  background: #cbecfb;
  width: 100%;
  height: 100vh;
  position: fixed;
  margin-top: -10px;
  z-index: 1;
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
}
.cmaskImg {
  width: 128px;
}
.cmaskInfo {
  width: 130px;
  text-align: center;
  display: flex;
  flex-direction: column;
  font-weight: normal;
  font-size: 20px;
}
.cmaskInfo p {
  margin-top: 23px;
  margin-bottom: 15px;
}
/* header */
.cartHeader {
  width: 100%;
  height: 50px;
  display: flex;
  justify-content: flex-end;
  position: fixed;
  top: 0;
  background: linear-gradient(90deg, #e1f5fb, #ebf8ff);
  z-index: 1;
  margin-bottom: 50px;
  border: 0px;
}
.cartHeader div {
  width: 100px;
  height: 50px;
  line-height: 50px;
  text-align: center;
  font-size: 19px;
}
/* cart item */
.cartItem {
  height: 100px;
  box-shadow: 0px 0px 5px 0px #c26dd2a8;
  border-radius: 10px;
  margin: 10px;
  position: relative;
}
.cartItemImg {
  width: 90px;
  height: 70px;
  border-radius: 10px;
  position: absolute;
  top: 15px;
  left: 10px;
}
.cartTitle {
  position: absolute;
  left: 30%;
  top: 5%;
  font-size: 18px;
}
.cartCounter {
  width: 32px;
  height: 88px;
  display: flex;
  justify-content: space-between;
  flex-direction: column;
  align-items: center;
  position: absolute;
  top: 10%;
  left: 80%;
}
.counterBtn img {
  width: 16px;
}
.cartPrice {
  width: 140px;
  font-weight: bold;
  color: #00aaef;
  font-size: 18px;
  position: absolute;
  left: 40%;
  top: 38%;
}
.delBtn {
  width: 22px;
  position: absolute;
  top: 50%;
  right: 10px;
  margin-top: -11px;
}
.checkedIcon{
  width: 23px;
  position: absolute;
  bottom: 6px;
  left: 87px;
}
/* footer */
.cartFooter {
  width: 100%;
  height: 50px;
  background: linear-gradient(-90deg, #e1f5fb, #ebf8ff);
  line-height: 50px;
  position: fixed;
  bottom: 58px;
  z-index: 2;
}
.buyBtn {
  width: 120px;
  height: 30px;
  text-align: center;
  background: linear-gradient(-90deg, #2193b0, #c26dd2a8);
  box-shadow: 0px 0px 10px 0px #c26dd2a8;
  font-weight: bold;
  line-height: 30px;
  border-radius: 30px;
  padding: 6px;
  position: absolute;
  top: 4px;
  right: 20px;
}
.leftH,
.rightH {
  width: 13px;
  height: 26px;
  /* border: 1px solid gray; */
  border-radius: 26px 0 0 26px;
  border-right: 0;
  position: absolute;
}
.leftH {
  transform: rotate(325deg);
  top: 14px;
  left: 27px;
  box-shadow: -3px 0px 16px 0px #b3b3b3;
}
.rightH {
  border-radius: 0 26px 26px 0;
  /* border-right: 1px solid gray; */
  /* border-left: 0; */
  top: 6px;
  left: 38px;
  transform: rotate(325deg);
  box-shadow: 3px 0px 16px 0px #b3b3b3;
}
/* 动态添加圆点选中表示 */
.selectStyle{
  background-color: #2193b0;
}
.chooseAllTxt {
  position: absolute;
  top: 0;
  left: 65px;
  font-weight: bold;
  font-size: 18px;
}
.cartTotal{
  width:150px;
  height:40px;
  background: linear-gradient(-90deg, #a6deea, #fff0);
  font-size: 18px;
  color: #5a5a5a;
  font-weight: bold;
  position: fixed;
  bottom: 129px;
  right: 0;
  text-align: right;
  line-height: 40px;
  padding-right: 20px;
}
</style>