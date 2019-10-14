function range(start, end) {
  if (start === end) return [];
  const arr = range(start, end - 1);
  arr.push(end - 1);
  return arr;
}

console.log('range');
console.log(range(1, 5));

function sumRec(arr) {
  if (arr.length === 0) return 0;
  return arr[arr.length - 1] + sumRec(arr.slice(0, arr.length - 1));
}

console.log('sumrec');
console.log(sumRec([1, 2, 3, 4]));


function exponent(base, exp) {
  if (exp === 0) return 1;
  return base * exponent(base, exp - 1)
}

console.log('exponent');
console.log(exponent(2, 5));


function fibonacci(n) {
  if (n < 2) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

console.log('fibonacci');
console.log(fibonacci(5));

