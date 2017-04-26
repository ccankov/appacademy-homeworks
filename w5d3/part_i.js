'use strict';

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

// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   let x = 'out of block again';
//   console.log(x);
// }

console.log(
  'Mystery scoping 1 prints: in block, in block'
);
mysteryScoping1();
console.log(
  'Mystery scoping 2 prints: in block, out of block'
);
mysteryScoping2();
console.log(
  'Mystery scoping 3 throws error due to const x being re-declared as var'
);
// mysteryScoping3();
console.log(
  'Mystery scoping 4 prints: in block, out of block'
);
mysteryScoping4();
console.log(
  'Mystery scoping 5 throws error due to double "let x" in single block scope'
);
// mysteryScoping5();

function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`;
}

console.log(madLib('make', 'best', 'guac'));

function isSubstring(searchString, subString) {
  let endIndex = searchString.length - subString.length;
  for (let i = 0; i < endIndex; i++) {
    let curSubStr = searchString.slice(i, i + subString.length);
    if (curSubStr === subString) {
      return true;
    }
  }
  return false;
}

console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));

function fizzBuzz(array) {
  let fzbzArray = [];
  for (let i = 0; i < array.length; i++) {
    let val = array[i];
    if ((val % 3 == 0 ? 1 : 0) ^ (val % 5 == 0 ? 1 : 0)) {
      fzbzArray[fzbzArray.length] = val;
    }
  }
  return fzbzArray;
}

console.log(fizzBuzz([3, 5, 15, 2, 18, 25]));

function isPrime(number) {
  for (var i = 2; i < (number / 2 + 1); i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

console.log(isPrime(2));
console.log(isPrime(4));
console.log(isPrime(10));
console.log(isPrime(15485863));
console.log(isPrime(3548563));

function firstNPrimes(n) {
  let nPrimes = [];
  let val = 2;
  while (nPrimes.length < n) {
    if (isPrime(val)) {
      nPrimes.push(val);
    }
    val++;
  }
  return nPrimes;
}

console.log(firstNPrimes(5));

function sumNPrimes(n) {
  let primes = firstNPrimes(n);
  return primes.reduce((a, b) => a + b, 0);
}

console.log(sumNPrimes(0));
console.log(sumNPrimes(1));
console.log(sumNPrimes(4));
