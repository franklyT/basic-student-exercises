let rows = 8;
let cols = 8;

for (let i = 0; i < rows; i++) {
  let board = "";

  for (let j = 0; j < cols; j++) {
    (j + i) % 2 !== 0 ? (board += "#") : (board += " ");
  }
  
  console.log(board);
}
