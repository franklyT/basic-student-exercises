<script>
export default {
  name: "CatFacts",
  props: {
    msg: String
  },
  data() {
    return {
      logPic: null,
      logFact: null
    };
  },
  methods: {
    fetchItems() {
      fetch("https://cat-fact.herokuapp.com/facts", {
        method: "GET"
      })
        .then(stream => stream.json())
        .then(
          data =>
            (this.logFact =
              data.all[this.getRandomIntInclusive(0, data.all.length)].text)
        )
        .catch(error => console.error(error));
      fetch("https://api.thecatapi.com/v1/images/search", {
        method: "GET"
      })
        .then(stream => stream.json())
        .then(data => (this.logPic = data[0].url))
        .catch(error => console.error(error));
    },
    getRandomIntInclusive(min, max) {
      min = Math.ceil(min);
      max = Math.floor(max);
      return Math.floor(Math.random() * (max - min + 1)) + min; //The maximum is inclusive and the minimum is inclusive
    }
  },
  mounted() {
    this.fetchItems();
  }
};
</script>

<template>
  <div class="cat-facts">
    <img
      class="loader"
      :src="logPic"
      onload="document.querySelector('.loader').classList.remove('loader')"
    />
    <h1 class="fact">{{ logFact }}</h1>
  </div>
</template>

<style scoped>
h3 {
  margin: 40px 0 0;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}

img {
  height: 28em;
  width: 28em;
  border: 10px solid rgb(255, 120, 120);
  border-radius: 100em;
}

.loader {
  border: 10px solid rgb(255, 120, 120);
  border-top: 10px solid rgb(220, 180, 0);
  border-radius: 50%;
  width: 28em;
  height: 28em;
  animation: spin 2s linear infinite;
}

.fact {
  margin-left: 10em;
  margin-right: 10em;
  font-size: 2em;
  -webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: white;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>
