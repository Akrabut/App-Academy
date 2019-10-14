/* eslint-disable no-return-assign */
/* eslint-disable no-extend-native */
/** disable es-lint */

let tooSoon = false;

Function.prototype.myThrottle = function (interval) {
  if (!tooSoon) {
    tooSoon = true;
    setTimeout(() => tooSoon = false, interval);
  }
};


class Neuron {
  fire() {
    console.log("Firing!");
  }
}

const neuron = new Neuron();
// When we create a new Neuron,
// we can call #fire as frequently as we want

// The following code will try to #fire the neuron every 10ms. Try it in the console:
const interval = setInterval(() => {
  neuron.fire();
}, 10);

// You can use clearInterval to stop the firing:
// clearInterval(interval);
neuron.fire = neuron.fire.myThrottle(interval);
neuron.fire;
