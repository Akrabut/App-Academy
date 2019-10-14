/**
 * Initializes the Piece with its color.
 */
function Piece (color) {
  this.color = color;
}

/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
  return (this.color === 'black' ? 'black' : 'white');
};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
  // eslint-disable-next-line no-unused-expressions
  this.color === 'black' ? this.color = 'white' : this.color = 'black';
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
  if (this.color === 'black') return 'B';
  return 'W';
};

module.exports = Piece;
