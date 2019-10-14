/* eslint-disable no-unused-expressions */
/* eslint-disable no-underscore-dangle */
class Clock {
  constructor() {
    const date = new Date();
    this.secs = date.getSeconds();
    this.mins = date.getMinutes();
    this.hrs = date.getHours();
    this.printTime();
    setInterval(this._tick.bind(this), 1000);
  }

  // eslint-disable-next-line class-methods-use-this
  static formatTime(time) {
    return (time < 10 ? `0${time.toString()}` : time);
  }

  printTime() {
    console.log(`Current time is ${Clock.formatTime(this.hrs)}:${Clock.formatTime(this.mins)}:${Clock.formatTime(this.secs)}`);
  }

  _tick() {
    this.incrementSeconds();
    this.printTime();
  }

  incrementSeconds() {
    if (this.secs === 59) {
      this.secs = 0;
      this.incrementMinutes();
    } else {
      this.secs += 1;
    }
  }

  incrementMinutes() {
    if (this.mins === 59) {
      this.mins = 0;
      this.incrementHours();
    } else {
      this.mins += 1;
    }
  }

  incrementHours() {
    if (this.hrs === 23) {
      this.hrs = 0;
    } else {
      this.hrs += 1;
    }
  }
}

const clock = new Clock();
