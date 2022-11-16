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
    SET_USER_INFO: (state, username) => {
      state.userInfo = username;
      sessionStorage.setItem("username", JSON.stringify(username));
    },
    REMOVE_INFO: (state) => {
      state.token = '';
      state.username = '';
      localStorage.removeItem("token")
      sessionStorage.removeItem("username");
    },
    SET_STYLE: (state, style) => {
      state.style = style
      localStorage.setItem("style", JSON.stringify(style))
    },
  },
  getters:{
    getUser: state => {
      if (state.username === '') {
        let sessionUser = sessionStorage.getItem('username')
        if (sessionUser != null) {
          state.username = JSON.parse(sessionUser)
          return sessionUser
        }
      }
      return state.username
    },
    getToken: state => {
      console.log(state.token + "===")
      if (!state.token) {
        let localToken = localStorage.getItem('token')
        if (localToken != null) {
          state.token = JSON.parse(localToken)
          return localToken
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
