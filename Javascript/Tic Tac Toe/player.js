
class Player {
  constructor(real, mark) {
    this.real = real;
    this.mark = mark;
  }

  static generateNum() {
    return Math.floor(Math.random() * 3);
  }

  static stupidBot() {
    return [Player.generateNum(), Player.generateNum()];
  }
}

module.exports = Player;
