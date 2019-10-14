/* eslint-disable no-extend-native */
/* eslint-disable no-plusplus */
Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function (callback) {
  const result = [];
  this.myEach((e) => result.push(callback(e)));
};

Array.prototype.myReduce = function (callback, acc = this[0]) {
  let result = acc;
  this.myEach((e) => {
    result = callback(e, result);
  });
  return result;
};

console.log([1, 2, 3, 4].myReduce((e, sum) => e + sum, 8));
