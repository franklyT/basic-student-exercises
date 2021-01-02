let heads_count = 0;
let tails_count = 0;
const max_interations = 100_000;

for (let i = 0; i < max_interations; i++) {
    (Math.floor(Math.random() * 2) + 1 === 1) ? heads_count++ : tails_count++;
}

console.log(`Heads #: ${heads_count}`);
console.log(`Tails #: ${tails_count}`);
