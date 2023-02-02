games = Game.create([
  { host_id: 1, no_players: 4, turn: "red", round: 1, phase: "move", status: "pending" },
  { host_id: 1, no_players: 4, turn: "red", round: 1, phase: "move", status: "pending" },
  { host_id: 1, no_players: 4, turn: "red", round: 1, phase: "move", status: "pending" },
  { host_id: 2, no_players: 3, turn: "red", round: 1, phase: "move", status: "pending" },
  { host_id: 2, no_players: 3, turn: "red", round: 1, phase: "move", status: "pending" },
  { host_id: 2, no_players: 3, turn: "red", round: 1, phase: "move", status: "pending" },
  { host_id: 3, no_players: 2, turn: "red", round: 1, phase: "move", status: "pending" },
  { host_id: 3, no_players: 2, turn: "red", round: 1, phase: "move", status: "pending" },
  { host_id: 4, no_players: 2, turn: "red", round: 1, phase: "move", status: "pending" },
  { host_id: 4, no_players: 2, turn: "red", round: 1, phase: "move", status: "pending" },
  { host_id: 4, no_players: 2, turn: "red", round: 1, phase: "move", status: "pending" },
  { host_id: 4, no_players: 2, turn: "red", round: 1, phase: "move", status: "pending" }
])

boards = games.map {|game| game.make_board }