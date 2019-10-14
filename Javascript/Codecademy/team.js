const team = {
  _players:
  [
    {
      firstName: 'Pablo',
      lastName: 'Sanchez',
      age: 11,
    },
    {
      firstName: 'Ehad',
      lastName: 'Shtaim',
      age: 36,
    },
    {
      firstName: 'Shalosh',
      lastName: 'Arba',
      age: 2,
    },
  ],
  _games:
  [
    {
      opponent: 'Broncos',
      teamPoints: 42,
      opponentPoints: 27,
    },
    {
      opponent: 'Hapoel Beer Sheva',
      teamPoints: 51,
      opponentPoints: 30,
    },
    {
      opponent: 'Maccabi Haifa',
      teamPoints: 30,
      opponentPoints: 51,
    },
  ],
  get players() {
    return this._players;
  },
  get games() {
    return this._games;
  },
  addPlayer(firstName, lastName, age) {
    this._players.push(
      {
        firstName,
        lastName,
        age,
      },
    );
  },
  addGame(opponent, teamPoints, opponentPoints) {
    this._games.push(
      {
        opponent,
        teamPoints,
        opponentPoints,
      },
    );
  },
};

console.log('hi');
console.log(team.players);
team.addPlayer('Hamesh', 'Shesh', 56);
console.log(team.players);
console.log(team.games);
team.addGame('Hakoah Bullshit', 11, 72);
console.log(team.games);
