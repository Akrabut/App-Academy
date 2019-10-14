/* eslint-disable no-continue */
const Board = require('./board');
const Player = require('./player');

class Game {
  constructor() {
    this.board = new Board();
    this.p1 = new Player(false, 'X');
    this.p2 = new Player(false, 'O');
    this.players = [this.p1, this.p2];
    this.turn = 0;
    this.board.render();
  }

  currentPlayer() {
    return this.players[this.turn];
  }

  nextPlayer() {
    this.turn = (this.turn + 1) % this.players.length;
  }

  // async takeTurn() {
    
  //   return 
  // }

  gameOver(turn, mark) {
    return this.board.horizontalWin(turn, mark) || this.board.verticalWin(turn, mark) || this.board.rightDiagonalWin(mark) || this.board.leftDiagonalWin(mark);
  }

  endGame(turn) {
    if (this.gameOver(turn, this.currentPlayer().mark)) {
      console.log(`${this.currentPlayer().mark} has won!`);
    } else {
      console.log('Its a draw!');
    }
    this.board.render();
  }

  async run() {
    let winner = false;
    while (!winner) {
      const turn = await Player.stupidBot();
      if (this.board.isEmpty(turn)) {
        console.log(`Player ${this.currentPlayer().mark}'s play: ${turn}`);
        await new Promise((resolve) => setTimeout(resolve, 2000));
        this.board.writeToBoard(turn, this.currentPlayer().mark);
        this.board.render();
      } else {
        continue;
      }
      winner = this.gameOver(turn, this.currentPlayer().mark);
      if (winner) return this.endGame(turn);
      this.nextPlayer();
    }
  }
}

g = new Game();
g.run();
