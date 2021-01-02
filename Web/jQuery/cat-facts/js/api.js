import { CatFacts } from './CatFacts.js';

$(document).ready(function () {
    let Cats = new CatFacts();

    $.ajax({
        url: "https://cat-fact.herokuapp.com/facts", success: function (result) {
            Cats.logFact((result.all[Cats.Helpers.getRandomIntInclusive(0, result.all.length)].text));
        }
    })

    $.ajax({
        url: "https://api.thecatapi.com/v1/images/search", success: function (result) {
            Cats.logPic(result[0].url);
        }
    })
});