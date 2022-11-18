import { createStore } from 'vuex'

export default createStore({
  state: {
    taken:'',
    userInfo:'',
    style:{}
  },
  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token;
      localStorage.setItem("token", JSON.stringify(token))
    },
    SET_USER_INFO: (state, userInfo) => {
      state.userInfo = userInfo;
      sessionStorage.setItem("userInfo", JSON.stringify(userInfo));
    },
    REMOVE_INFO: (state) => {
      state.token = '';
      state.username = '';
      localStorage.removeItem("token")
      sessionStorage.removeItem("userInfo");
    },
    SET_STYLE: (state, style) => {
      state.style = style
      localStorage.setItem("style", JSON.stringify(style))
    },
  },
  getters:{
    getUser: state => {
      if (!state.userInfo) {
        let sessionUser = sessionStorage.getItem('userInfo')
        if (sessionUser != null) {
          state.userInfo = JSON.parse(sessionUser)
        }
      }
      return state.userInfo
    },
    getToken: state => {
      if (!state.token) {
        let localToken = localStorage.getItem('token')
        if (localToken != null) {
          state.token = JSON.parse(localToken)
        }
      }
      return state.token
    },
    getStyle: state => {
      if (state.style == null) {
        let style = localStorage.getItem('style')
        if (style != null) {
          state.style = JSON.parse(style)
          return style
        }
      }
      return state.style
    },
  },
  actions: {
  },
  modules: {
  }
})
