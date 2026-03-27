<script setup lang="ts">
import { ref, onMounted } from 'vue'

const users = ref<any[]>([])
const loading = ref(true)
const error = ref('')

const fetchUsers = async () => {
  try {
    const response = await fetch('http://localhost:8080/api/users')
    if (!response.ok) {
      throw new Error('伺服器錯誤')
    }
    users.value = await response.json()
  } catch (err) {
    error.value = '抓取資料失敗: ' + err
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  fetchUsers()
})
</script>

<template>
  <div class="user-list">
    <h2>使用者信箱列表</h2>
    <div v-if="loading">載入中...</div>
    <div v-else-if="error">{{ error }}</div>
    <table v-else>
      <thead>
        <tr>
          <th>名字</th>
          <th>信箱</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="user in users" :key="user.id">
          <td>{{ user.name }}</td>
          <td>{{ user.email }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<style scoped>
.user-list {
  max-width: 600px;
  margin: 20px auto;
  padding: 20px;
}
table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}
th, td {
  border: 1px solid #ddd;
  padding: 12px;
  text-align: left;
}
th {
  background-color: #f4f4f4;
}
tr:nth-child(even) {
  background-color: #fafafa;
}
</style>
