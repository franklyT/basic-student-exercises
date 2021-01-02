function range(arg1, arg2, step = 1) {
    let range = [];

    for (let iterator = arg1; iterator < arg2 + 1; iterator += step) {
        range.push(iterator);
    }

    return range;
}

// caps below a range 0, 10_000 call

function recursiveSum(numArr, sumNum = 0) {
    numArr.length < 1 ? console.log(sumNum) : recursiveSum(numArr.slice(1), sumNum + numArr[0]);

}

// easily handles 100_000_000 iterations

function iterativeSum(numArr) {
    let sumNum = 0;

    numArr.forEach( (num) => {
        sumNum += num;
    });

    console.log(sumNum);
}



iterativeSum(range(0, 99));
recursiveSum(range(0, 7000));
