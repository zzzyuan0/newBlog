import { createStore } from 'vuex'

export default createStore({
  state: {
    taken:'',
    userInfo:''
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
      if (state.token === '') {
        let localToken = localStorage.getItem('username')
        if (localToken != null) {
          state.username = JSON.parse(localToken)
          return localToken
        }
      }
      return state.username
    },
  },
  actions: {
  },
  modules: {
  }
})
