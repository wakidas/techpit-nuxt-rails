<template>
  <div>
    <p v-if="user">名前: {{ user.name }}</p>
    <AddTodo @submit="addTodo"></AddTodo>
    <TodoList :todos="todos"></TodoList>
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
      return this.$store.state.auth.currentUser;
    }
  },
  created() {
    console.log("APIKEY: ", process.env.API_KEY);
  },
  methods: {
    async addTodo(title){
      await axios.post("/v1/todos", {title});
      this.todos.push({
        title
      })
    }
  }
}
</script>

<style></style>
