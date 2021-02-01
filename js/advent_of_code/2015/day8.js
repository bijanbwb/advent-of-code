/* IMPORTS */
const fs = require('fs');

/* PARSE INPUT */

const input = fs.readFileSync('./day8_input.txt', 'utf-8').split('\n');

/* PART I */
const partOneResult = input.reduce((acc, line) =>
  acc + (line.length - eval(line).length),
  0
);

console.log(`Part I Result: ${partOneResult}`);

/* PART II */

const partTwoResult = input.reduce((acc, line) =>
  acc + (2 + line.replace(/\\/g, '\\\\').replace(/"/g, '\\"').length - line.length),
  0
);

console.log(`Part I Result: ${partTwoResult}`);
