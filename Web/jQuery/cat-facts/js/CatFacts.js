import { Helpers } from './Helpers.js';

export class CatFacts {
  CAT_IMAGE = $("#cat-image");
  CAT_FACT = $("#cat-fact");
  FACT_BOX = $("#fact-box");
  IMG_BORDER = $("#img-border");

  Helpers = new Helpers();

  logPic(data) {
    this.CAT_IMAGE.attr("src", data);
    this.CAT_IMAGE.on("load", () => {
      this.CAT_IMAGE.removeClass("loader");
      this.IMG_BORDER.css("background", "none");
    });
  }

  logFact(data) {
    this.CAT_FACT.text(data);
    this.FACT_BOX.addClass("fact-box--transition");
  }
}
