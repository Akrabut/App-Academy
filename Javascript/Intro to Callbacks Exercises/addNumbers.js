/* eslint-disable no-param-reassign */
/* eslint-disable no-plusplus */
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question('Enter a number\n', (num) => {
      numsLeft--;
      sum += parseInt(num, 10);
      console.log(`current sum is ${sum}`);
      addNumbers(sum, numsLeft, completionCallback);
    });
  } else {
    completionCallback(sum);
  }
}

addNumbers(0, 5, (sum) => {
  console.log(`the total is ${sum}`);
  reader.close();
});