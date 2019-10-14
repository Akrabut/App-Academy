function titleize(arr, callback) {
  callback(arr.map((name) => `Mx. ${name} Jingleheimer Schmidt`));
}

titleize(['Mary', 'Brian', 'Leo'], (arr) => {
  arr.forEach((ele) => console.log(ele));
});

class Elephant {
  constructor(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
  }

  trumpet() {
    console.log(`${this.name} the elephant goes phrRRRRRRRRRRR!!!!!!!`);
  }

  grow() {
    this.height += 12;
  }

  addTrick(trick) {
    this.tricks.push(trick);
  }

  play() {
    console.log(this.tricks[Math.floor(Math.random() * (this.tricks.length))]);
  }

  static paradeHelper(elephant) {
    const name = `${elephant.name[0].toUpperCase()}${elephant.name.slice(1, elephant.name.length)}`;
    console.log(`${name} is trotting by!`);
  }
}

const e = new Elephant('Dumbo', '4', ['Painting a picture', 'Running in loops', 'Lifting things', 'Playing with a human']);
e.trumpet();
e.grow();
e.addTrick('Eat a fruit');
e.play();

const ellie = new Elephant('ellie', 185, ['giving human friends a ride', 'playing hide and seek']);
const charlie = new Elephant('charlie', 200, ['painting pictures', 'spraying water for a slip and slide']);
const kate = new Elephant('kate', 234, ['writing letters', 'stealing peanuts']);
const micah = new Elephant('micah', 143, ['trotting', 'playing tic tac toe', 'doing elephant ballet']);

const herd = [ellie, charlie, kate, micah];
herd.forEach(Elephant.paradeHelper);

let order = 'scrambled eggs and bacon';
const dinerBreakfast = (o) => {
  order += ` and ${o}`;
  console.log(`I'd like ${order} please.`);
};

const bfastOrder = dinerBreakfast;
bfastOrder('chocolate chip pancakes');
bfastOrder('grits');
