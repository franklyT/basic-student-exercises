// class-based design using js-doc type hinting

// @ts-check
const reader = require("readline-sync"); //npm install readline-sync

class Game {
  constructor() {
    this.thread();
  }

  thread() {
    this.setMinMax();
    this.setRandomNum(this.getMinimumNumber(), this.getMaximumNumber());
    this.askGuess();
  }

  setMinMax() {
    this.setMinimumNumber(reader.question("Please input a minimum number: "));
    this.setMaximumNumber(reader.question("Please input a maximum number: "));
  }

  /**
   * @param {string} min Minimum number.
   **/

  setMinimumNumber(min) {
    this.minimum = Number(min);

    console.log(`Minimum set to ${this.getMinimumNumber()}.`);
  }

  /**
   * @param {string} max Maximum number.
   **/

  setMaximumNumber(max) {
    this.maximum = Number(max);

    console.log(`Maximum set to ${this.getMaximumNumber()}.`);
  }

  getMaximumNumber() {
    return this.maximum;
  }

  getMinimumNumber() {
    return this.minimum;
  }

  /**
   * @param {number} min Minimum number.
   * @param {number} max Maximum number.
   **/

  setRandomNum(min, max) {
    this.randomNum = Math.floor(Math.random() * (max - min) + min);
  }

  getRandomNum() {
    return this.randomNum;
  }

  askGuess() {
    this.setGuessNumber("");

    while (this.getGuessNumber() != this.getRandomNum()) {
      this.setGuessNumber(reader.question("Please input a guess: "));
      this.checkGuess(this.getGuessNumber());
    }
  }

  /**
   * @param {string} guess Given guess.
   **/

  setGuessNumber(guess) {
    this.guess = Number(guess);
  }

  getGuessNumber() {
    return this.guess;
  }

  /**
   * @param {number} guess Given guess.
   **/

  checkGuess(guess) {
    if (guess < this.getRandomNum())
      console.log("Guess is lower than hidden number.");
    else if (guess > this.getRandomNum())
      console.log("Guess is higher than hidden number.");
    else console.log(`You guessed the correct number, ${guess}! You win!`);
  }
}

new Game();
