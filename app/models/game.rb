class Game < ApplicationRecord

  belongs_to :host, class_name: 'User'
  has_many :players, class_name: 'User', dependent: :destroy
  has_many :pieces, dependent: :destroy

  validates :no_players, numericality: { less_than: 5 }

  def generate_pieces(game_id)
    game = Game.find(game_id)
    players = game.players
    starting_pawns = [...players.map{|player| generate_starting_pawns(game.id, player.id, player.color)}]
    remaining_deck = [...players.map{|player| generate_deck(game.id, player.id)}]
    return [...starting_pawns, ...remaining_deck]
  end

  def generate_starting_pawns(game_id, player_id, color)
    def generate_pawn(location)
      Piece.create({ :game_id => game_id, :player_id => player_id, :type => "pawn", :first_move => true, :location => location })
    end
    if color == "red"
      placement = 21
      pieces = []
      4.times {
        piece = generate_pawn(placement)
        placement += 10
        pieces << piece
      }
      return pieces
    elsif color == "blue"
      placement = 26
      pieces = []
      4.times {
        piece = generate_pawn(placement)
        placement += 10
        pieces << piece
      }
      return pieces
    elsif color == "green"
      placement = 12
      pieces = []
      4.times {
        piece = generate_pawn(placement)
        placement += 1
        pieces << piece
      }
      return pieces
    else
      placement = 62
      pieces = []
      4.times {
        piece = generate_pawn(placement)
        placement += 1
        pieces << piece
      }
      return pieces
    end
  end

  def generate_deck(game_id, player_id)
    def generate_piece(type, location)
      Piece.create({ :game_id => game_id, :player_id => player_id, :type => type, :first_move => true, :location => location })
    end
    unused_locations = [71, 72, 73, 74, 81, 82, 83, 84, 85, 86, 87, 88]
    unplaced_pieces = ["pawn", "pawn", "pawn", "pawn", "rook", "rook", "knight", "knight", "bishop", "bishop", "queen", "king"]
    pieces = unplaced_pieces.map{|piece|
      placement = unused_locations.sample
      piece_type = uplaced_pieces.first
      new_piece = generate_piece(piece_type, placement)
      unused_locations = unused_locations.filter{|loc| loc !== placement}
      unplaced_pieces = unplaced_pieces.drop(1)
      return new_piece
    }
    return pieces
  end

end
