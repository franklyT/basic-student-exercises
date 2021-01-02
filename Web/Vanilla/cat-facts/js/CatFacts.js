import { Helpers } from "./Helpers.js";

export class CatFacts {
  CAT_IMAGE = document.getElementById("cat-image");
  CAT_FACT = document.getElementById("cat-fact");
  FACT_BOX = document.getElementById("fact-box");
  IMG_BORDER = document.getElementById("img-border");

  Helpers = new Helpers();

  logPic(data) {
    this.CAT_IMAGE.src = data;
    this.CAT_IMAGE.addEventListener("load", () => {
      this.CAT_IMAGE.classList.remove("loader");
      this.IMG_BORDER.style.background = "none";
    });
  }

  logFact(data) {
    this.CAT_FACT.innerHTML = data;
    this.FACT_BOX.classList.add("fact-box--transition");
  }
}
