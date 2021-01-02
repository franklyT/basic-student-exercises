// iterative
function iterativeRoundToNext5(num) {
    while (num % 5 !== 0) {
        num += 1;
    }
    console.log(num)
}

// recursive

function recursiveRoundToNext5(num) {
    if (num % 5 === 0) return console.log(num);

    recursiveRoundToNext5(num + 1);
}

iterativeRoundToNext5(1);
recursiveRoundToNext5(1);
