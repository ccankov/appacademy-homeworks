'use strict';

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndCrumpets() {
  let first, second;

  const formResponse = () => {
    let firstRes = first === 'yes' ? 'do' : "don't";
    let secondRes = second === 'yes' ? 'do' : "don't";
    console.log(`So you ${firstRes} want some tea and you ${secondRes} want some crumpets`);
  };

  const secondQuestion = () => {
    reader.question('Would you like some crumpets?', (res) => {
      reader.close();
      second = res;
      console.log(`You replied ${res}`);
      formResponse();
    });
  };

  reader.question('Would you like some tea?', (res) => {
    first = res;
    console.log(`You replied ${res}`);
    secondQuestion();
  });

}

teaAndCrumpets();
