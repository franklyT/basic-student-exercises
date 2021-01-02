function getMiddle(str) {
    console.log(str.length)
    if (str.length % 2 === 0) return str[str.length / 2 -1] + str[str.length / 2];
    return str[Math.floor(str.length / 2)];
}

console.log(getMiddle('The middle character is ha'))
