games = Game.create([
  { host_id: User.first.id, no_players: 4, turn: "red", round: 1, status: "initiated" },
  { host_id: User.first.id, no_players: 4, turn: "red", round: 1, status: "initiated" },
  { host_id: User.first.id, no_players: 4, turn: "red", round: 1, status: "initiated" },
  { host_id: User.second.id, no_players: 3, turn: "red", round: 1, status: "initiated" },
  { host_id: User.second.id, no_players: 3, turn: "red", round: 1, status: "initiated" },
  { host_id: User.second.id, no_players: 3, turn: "red", round: 1, status: "initiated" },
  { host_id: User.third.id, no_players: 2, turn: "red", round: 1, status: "initiated" },
  { host_id: User.third.id, no_players: 2, turn: "red", round: 1, status: "initiated" },
  { host_id: User.fourth.id, no_players: 2, turn: "red", round: 1, status: "pending" },
  { host_id: User.fourth.id, no_players: 2, turn: "red", round: 1, status: "pending" },
  { host_id: User.fourth.id, no_players: 2, turn: "red", round: 1, status: "pending" },
  { host_id: User.fourth.id, no_players: 2, turn: "red", round: 1, status: "pending" }
]);