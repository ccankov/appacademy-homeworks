'use strict';

function titleize(names, printCallback) {
  let titleizedNames = names.map((name) => `Mx. ${name} Jingleheimer Schmidt`);
  printCallback(titleizedNames);
}

function printCallback(array) {
  array.forEach((el) => console.log(el));
}

titleize(["Mary", "Brian", "Leo"], printCallback);
