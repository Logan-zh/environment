<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <header>
    <nav>
      <RouterLink to="/list">使用者列表</RouterLink> |
      <RouterLink to="/create">新增使用者</RouterLink>
    </nav>
  </header>

  <main>
    <RouterView />
  </main>
</template>

<style scoped>
header {
  line-height: 1.5;
  max-width: 100%;
  padding: 1rem;
  background-color: #f8f9fa;
  border-bottom: 1px solid #e9ecef;
  margin-bottom: 2rem;
  text-align: center;
}

nav {
  font-size: 1.2rem;
}

nav a {
  display: inline-block;
  padding: 0 1rem;
  text-decoration: none;
  color: #2c3e50;
  font-weight: bold;
}

nav a.router-link-exact-active {
  color: #42b983;
}

nav a:hover {
  color: #35495e;
}

main {
  padding: 0 2rem;
}
</style>
