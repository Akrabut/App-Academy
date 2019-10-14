/* eslint-disable no-plusplus */
class Board {
  constructor() {
    this.board = new Array(3);
    for (let i = 0; i < 3; i++) {
      this.board[i] = new Array(3);
    }
    this.initBoard();
  }

  render() {
    console.log('\n------------\n');
    this.board.forEach((subarr) => {
      console.log(subarr);
    });
    console.log('\n------------\n');
  }

  initBoard() {
    for (let i = 0; i < this.board.length; i++) {
      for (let j = 0; j < this.board[i].length; j++) {
        this.board[i][j] = '-';
      }
    }
  }

  isEmpty(pos) {
    return this.board[pos[0]][pos[1]] === '-';
  }

  writeToBoard(pos, mark) {
    this.board[pos[0]][pos[1]] = mark;
  }

  horizontalWin(pos, mark) {
    for (let i = 0; i < this.board.length; i++) {
      if (this.board[pos[0]][i] !== mark) return false;
    }
    return mark;
  }

  verticalWin(pos, mark) {
    for (let i = 0; i < this.board.length; i++) {
      if (this.board[i][pos[1]] !== mark) return false;
    }
    return mark;
  }

  rightDiagonalWin(mark) {
    for (let i = 0; i < this.board.length; i++) {
      if (this.board[i][i] !== mark) return false;
    }
    return mark;
  }

  leftDiagonalWin(mark) {
    if (this.board[2][0] === mark && this.board[0][2] === mark && this.board[1][1] === mark) return mark;
    return false;
  }
}


module.exports = Board;
