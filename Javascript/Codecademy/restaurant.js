/* eslint-disable no-underscore-dangle */
/* eslint-disable no-console */
const menu = {
  _courses: {
    appetizers: [],
    mains: [],
    desserts: []
  },
  get appetizers() {
    return this._courses.appetizers;
  },
  get mains() {
    return this._courses.mains;
  },
  get desserts() {
    return this._courses.desserts;
  },
  get courses() {
    return Object.entries(this._courses);
  },
  addDishToCourse(courseName, dishName, dishPrice) {
    const dish = {
      name: dishName,
      price: dishPrice,
    };
    this._courses[courseName].push(dish);
  },
  getRandomDishFromCourse(courseName) {
    const dishes = this[courseName];
    return dishes[Math.floor(Math.random() * dishes.length)];
  },
  generateRandomMeal() {
    const appetizer = this.getRandomDishFromCourse('appetizers');
    const main = this.getRandomDishFromCourse('mains');
    const dessert = this.getRandomDishFromCourse('desserts');
    const sum = appetizer.price + main.price + dessert.price;
    return `Your randomized meal contains ${appetizer.name}, ${main.name} and ${dessert.name} and costs ${sum} NIS`;
  },
};

console.log(menu.courses);
menu.addDishToCourse('desserts', 'protein powder', 1);
menu.addDishToCourse('desserts', 'ice cream', 5);
menu.addDishToCourse('mains', 'hamburger', 20);
menu.addDishToCourse('mains', 'rice with peas', 13);
menu.addDishToCourse('appetizers', 'orange juice', 3);
menu.addDishToCourse('appetizers', 'salad', 5);
// menu.addDishToCourse('wallak', 'wat', 666)
console.log(menu.courses);
console.log(menu.appetizers);
console.log(menu.getRandomDishFromCourse('appetizers'));
console.log(menu.generateRandomMeal());
