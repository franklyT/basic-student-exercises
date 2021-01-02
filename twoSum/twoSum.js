// destructuring

function twoSum(numbers, target) {
    for (let [index1, num1] of numbers.entries()) {
        for (let [index2, num2] of numbers.entries()) {
            if ((num1 + num2 === target) && (index1 !== index2)) return [index1, index2]
        }
    }
}

console.log(twoSum([1, 2, 3,4], 5));
