function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function () {
  return `${this.owner} loves ${this.name}`;
};

const c1 = new Cat('mitzi', 'or');
const c2 = new Cat('hatuli', 'mishu');
console.log(c1.cuteStatement());
console.log(c2.cuteStatement());

Cat.prototype.cuteStatement = function () {
  return `Everyone loves ${this.name}!`;
};

console.log(c1.cuteStatement());
console.log(c2.cuteStatement());

Cat.prototype.meow = function () {
  return `${this.name} meows`;
};

console.log(c1.meow());
console.log(c2.meow());

c1.meow = function () {
  return `${this.name} now meows in a different way`;
};

console.log(c1.meow());
console.log(c2.meow());


