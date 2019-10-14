function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

function madLib(str1, str2, str3) {
  console.log(`We shall ${str1.toUpperCase()} the ${str2.toUpperCase()} ${str3.toUpperCase()}.`);
}

function isSubString(str, substr) {
  return str.includes(substr);
}

console.log(isSubString("time to program", "time"));
console.log(isSubString("Jump for joy", "joys"));

function fizzBuzz(arr) {
  return arr.filter((ele) => {
    return (ele % 3 === 0 || ele % 5 === 0) && !(ele % 15 === 0);
  });
}

console.log(fizzBuzz([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]));

function isPrime(n) {
  if (n === 1) return false;
  for (let index = 2; index < n / 2 + 1; index++) {
    if (n % index == 0) return false;
  }
  return true;
}

console.log(isPrime(2));
console.log(isPrime(10));
console.log(isPrime(15485863));
console.log(isPrime(3548563));

function sumOfNPrimes(n) {
  sum = 0;
  count = 0;
  i = 0;
  while (count <= n) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }
    i++;
  }
  return sum;
}

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));