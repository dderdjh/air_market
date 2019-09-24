import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    type:0
  },
  mutations: {
    setType(state,val) {
      state.type = val
    }
  },
  actions: {

  },
  getters:{
    getType(state) {
      return state.type
    }
  }
})
