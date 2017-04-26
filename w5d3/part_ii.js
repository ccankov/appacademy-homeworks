'use strict';

function titleize(names, printCallback) {
  let titleizedNames = names.map((name) => `Mx. ${name} Jingleheimer Schmidt`);
  printCallback(titleizedNames);
}

function printCallback(array) {
  array.forEach((el) => console.log(el));
}

titleize(["Mary", "Brian", "Leo"], printCallback);

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};
Elephant.prototype.grow = function() {
  this.height += 12;
};
Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick)
};
Elephant.prototype.play = function() {
  let trickIndex = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];
ellie.trumpet();
console.log(ellie.height);
ellie.grow();
console.log(ellie.height);
console.log(ellie.tricks);
ellie.addTrick('doing a new trick');
console.log(ellie.tricks);
ellie.play();
ellie.play();
ellie.play();
ellie.play();
ellie.play();

Elephant.paradeHelper = function paradeHelper(elephant) {
  console.log(`${elephant.name} is trotting by!`);
}

Elephant.paradeHelper(micah);
herd.forEach(Elephant.paradeHelper);

function dinerBreakfast() {
  var menu_items = [];

  function add_and_display(item) {
    menu_items.push(item);
    console.log(menu_items);
  }

  return add_and_display;
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");
