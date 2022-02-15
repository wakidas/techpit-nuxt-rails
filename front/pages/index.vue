<template>
  <div>
    <p v-if="user">名前: {{ user.name }}</p>
    <AddTodo @submit="addTodo"></AddTodo>
    <TodoList :todos="user.todos"></TodoList>
  </div>
</template>

<script>
import AddTodo from "@/components/AddTodo";
import TodoList from "@/components/TodoList";
import axios from "@/plugins/axios";


export default {
  components: {
    AddTodo,
    TodoList
  },
  data(){
    return{
      todos: [],
    };
  },
  computed: {
    user() {
      console.log('computedが呼ばれた');
      console.log(this.$store.state.auth.currentUser);
      return this.$store.state.auth.currentUser;
    }
  },
  created() {
    console.log("ログイン情報: ", this.$store.state.auth.currentUser);
  },
  methods: {
    async addTodo(todo){
      const {data} = await axios.post("/v1/todos", {todo});

      this.$store.dispatch("auth/setUser", {
        ...this.user,
        todos: [...this.user.todos, data]
      })
    }
  },
  fetch ({
    store,
    redirect
  }){
    store.watch(
      state => state.auth.currentUser,
      (newUser, oldUser) => {
        if(!newUser) {
          return redirect("/login");
        }
      }
    );
  },
}
</script>

<style></style>
