/* eslint-disable no-plusplus */
/* eslint-disable no-extend-native */
Array.prototype.bubbleSort = function () {
  let swapFlag = true;
  while (swapFlag) {
    swapFlag = false;
    for (let j = 0; j < this.length - 1; j++) {
      if (this[j] > this[j + 1]) {
        this[j] = this[j] + this[j + 1];
        this[j + 1] = this[j] - this[j + 1];
        this[j] = this[j] - this[j + 1];
        swapFlag = true;
      }
    }
  }
  return this;
};

console.log('bubble sort');
console.log([1, 2, 3, 4, 7, 9, 5].bubbleSort());
console.log([2, 4, 3, 5, 7, 1, 6].bubbleSort());


String.prototype.substrings = function () {
  const substrings = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i; j < this.length; j++) {
      substrings.push(this.slice(i, j + 1));
    }
  }
  return substrings;
};

console.log('substrings');
console.log('substrings'.substrings());
