<script>
import CatFacts from "./components/CatFacts.vue";

export default {
  name: "App",
  components: {
    CatFacts
  }
};
</script>

<template>
  <div id="app">
    <CatFacts  />
  </div>
</template>

<style>
body {
  background-color: rgb(11, 11, 11);
  
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: rgb(255, 120, 120);
  margin-top: 60px;
}
</style>
