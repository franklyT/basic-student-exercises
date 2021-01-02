function countBs(str) {
   return (Array.from(str).filter( (arrChar) => arrChar === "B")).length;
}

function countChar(str, char) {
    return (Array.from(str).filter( (arrChar) => arrChar === char)).length;
}
