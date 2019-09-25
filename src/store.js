import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    type:0,
    gid:0
  },
  mutations: {
    setType(state,val) {
      state.type = val;
    },
    setGid(state,val){
      state.gid = val;
    }
  },
  getters:{
    getType(state) {
      return state.type;
    },
    getGid(state) {
      return state.gid;
    }
  }
})
