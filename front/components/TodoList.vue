<template>
  <v-card>
    <v-card-title>
      Todo List
      <v-spacer></v-spacer>
      <v-text-firld v-model="search" label="Search" single-line hide-details></v-text-firld>
    </v-card-title>
    <v-data-table :headers="headers" :items="todos" :search="search"></v-data-table>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      todos: [
        {
          title: "test",
          username: "太郎"
        }
      ],
      search: "",
      headers: [
        {
          text: 'タイトル',
          align: "left",
          sortable: false,
          value: "title"
        },
        {
          text: 'ユーザー名',
          value: "username"
        }
      ],
    }
  }
}
</script>
