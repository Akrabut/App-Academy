/* eslint-disable no-plusplus */
/* eslint-disable no-extend-native */
Array.prototype.uniq = function () {
  const set = new Set();
  this.forEach((el) => set.add(el));
  return Array.from(set);
};

console.log('uniq');
console.log([1, 2, 2, 3, 3, 3].uniq());

function initKey(mapArr, i) {
  if (mapArr) {
    mapArr.push(i);
    return mapArr;
  }
  return [i];
}

Array.prototype.twoSum = function () {
  const posArr = [];
  const map = new Map();
  this.forEach((ele, i) => {
    if (map.has(-ele)) {
      map.get(-ele).forEach((val) => posArr.push([i, val]));
    }
    map.set(ele, initKey(map.get(ele), i));
  });
  return posArr;
};

console.log('two sum');
console.log([1, 2, 3, -1, 5, -5, 7, 9, -7, 2, -2].twoSum());

Array.prototype.transpose = function () {
  const transposed = new Array(this[0].length);
  for (let i = 0; i < transposed.length; i++) transposed[i] = new Array(this.length);
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      transposed[j][i] = this[i][j];
    }
  }
  return transposed;
}

console.log('transpose');
console.log([[1, 2], [3, 4], [5, 6]].transpose());
console.log([[1, 3, 5], [2, 4, 6]].transpose());
