class Game < ApplicationRecord

  belongs_to :host, class_name: 'User'
  has_many :players, dependent: :destroy
  has_many :pieces, dependent: :destroy

  validates :no_players, numericality: { less_than: 5 }

  #creates all the initial pieces for the game
  def generate_pieces()
    players = self.players
    starting_pawns = players.map{|player| generate_starting_pawns(self.id, player.id, player.color)}
    deck = players.map{|player| generate_deck(self.id, player.id)}
  end

  #creates the starting camp of pawns for each player
  def generate_starting_pawns(game_id, player_id, color)
    def generate_pawn(game, player, location)
      Piece.create({ :game_id => game, :player_id => player, :rank => "pawn", :first_move => true, :location => location })
    end
    if color == "red"
      placement = 21
      pieces = []
      4.times {
        piece = generate_pawn(game_id, player_id, placement)
        placement += 10
        pieces << piece
      }
      pieces
    elsif color == "blue"
      placement = 26
      pieces = []
      4.times {
        piece = generate_pawn(game_id, player_id, placement)
        placement += 10
        pieces << piece
      }
      pieces
    elsif color == "green"
      placement = 12
      pieces = []
      4.times {
        piece = generate_pawn(game_id, player_id, placement)
        placement += 1
        pieces << piece
      }
      pieces
    else
      placement = 62
      pieces = []
      4.times {
        piece = generate_pawn(game_id, player_id, placement)
        placement += 1
        pieces << piece
      }
      pieces
    end
  end

  #creates the hand (71-74) and deck (81-88) for each player
  def generate_deck(game_id, player_id)
    def generate_piece(game, player, rank, location)
      Piece.create({ :game_id => game, :player_id => player, :rank => rank, :first_move => true, :location => location })
    end
    unused_locations = [71, 72, 73, 74, 81, 82, 83, 84, 85, 86, 87, 88]
    unplaced_pieces = ["pawn", "pawn", "pawn", "pawn", "rook", "rook", "knight", "knight", "bishop", "bishop", "queen", "king"]
    pieces = unplaced_pieces.map{|piece|
      placement = unused_locations.sample
      piece_rank = unplaced_pieces.first
      new_piece = generate_piece(game_id, player_id, piece_rank, placement)
      unused_locations = unused_locations.filter{|loc| loc != placement}
      unplaced_pieces = unplaced_pieces.drop(1)
      new_piece
    }
  end

end
