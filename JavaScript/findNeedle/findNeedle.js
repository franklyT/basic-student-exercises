function findNeedle(haystack) {
    for (let [index, hay] of haystack.entries()) {
        if (hay === "needle") return `Found the needle at position ${index}.`;
    }
    return null;
}

console.log(findNeedle(['hay', 'junk', 'hay', 'hay', 'moreJunk', 'needle', 'randomJunk']));
