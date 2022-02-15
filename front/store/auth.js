export const state = () => ({
  currentUser: {}
})

export const mutations = {
  setUser(state, payload) {
    state.currentUser = payload
  }
}

export const actions = {
  setUser(context, data){
    console.log('actionsが呼ばれた');
    context.commit('setUser', data)
  }
}
