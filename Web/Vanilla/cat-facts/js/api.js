import { CatFacts } from "./CatFacts.js";

const Cats = new CatFacts();

axios
  .get("https://cat-fact.herokuapp.com/facts")
  .then(function(response) {
    Cats.logFact(
      response.data.all[
        Cats.Helpers.getRandomIntInclusive(0, response.data.all.length)
      ].text
    );
  })
  .catch(function(error) {
    console.error(error);
  });

axios
  .get("https://api.thecatapi.com/v1/images/search")
  .then(function(response) {
    Cats.logPic(response.data[0].url);
  })
  .catch(function(error) {
    console.error(error);
  });
