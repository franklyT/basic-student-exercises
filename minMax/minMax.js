function checkArrayMonotype(arr, type) {
    arr.forEach( (arg, index) => {
        if (typeof arg !== type) throw new Error(`Cannot compare numbers with ${typeof arg} '${arg}' @ index ${index}.`)
    })
}

function min(...args) {
    checkArrayMonotype(args, "number");
    console.log(args.sort()[0]);
}

function max(...args) {
    checkArrayMonotype(args, "number");
    console.log(args.sort()[args.length - 1]);
}

max(100_000_000, '10', '2', 10_000, 100_000)
