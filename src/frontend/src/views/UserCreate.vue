<script setup lang="ts">
import { ref } from 'vue'

const name = ref('')
const email = ref('')
const status = ref('')

const submitUser = async () => {
  try {
    const response = await fetch('http://localhost:8080/api/users', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        name: name.value,
        email: email.value,
      }),
    })

    if (!response.ok) {
      throw new Error('伺服器錯誤')
    }

    status.value = '新增成功！'
    name.value = ''
    email.value = ''
  } catch (error) {
    status.value = '新增失敗: ' + error
  }
}
</script>

<template>
  <div class="user-form">
    <h2>新增使用者</h2>
    <div class="form-group">
      <label>名字: </label>
      <input v-model="name" type="text" placeholder="請輸入名字" />
    </div>
    <div class="form-group">
      <label>信箱: </label>
      <input v-model="email" type="email" placeholder="請輸入信箱" />
    </div>
    <button @click="submitUser">送出</button>
    <p v-if="status">{{ status }}</p>
  </div>
</template>

<style scoped>
.user-form {
  max-width: 400px;
  margin: 20px auto;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
}
.form-group {
  margin-bottom: 15px;
}
input {
  width: 100%;
  padding: 8px;
  margin-top: 5px;
}
button {
  width: 100%;
  padding: 10px;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
button:hover {
  background-color: #3aa876;
}
</style>
