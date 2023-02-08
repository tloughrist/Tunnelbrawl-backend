class Board < ApplicationRecord

  belongs_to :game
  has_many :players, through: :game

  def begin_game(no_players)
    locs = ["loc21", "loc31", "loc41", "loc51", "loc26", "loc36", "loc46", "loc56", "loc12", "loc13", "loc14", "loc15", "loc62", "loc63", "loc64", "loc65", "loc101", "loc102", "loc103", "loc104", "loc111", "loc112", "loc113", "loc114", "loc115", "loc116", "loc117", "loc118", "loc201", "loc202", "loc203", "loc204", "loc211", "loc212", "loc213", "loc214", "loc215", "loc216", "loc217", "loc218", "loc301", "loc302", "loc303", "loc304", "loc311", "loc312", "loc313", "loc314", "loc315", "loc316", "loc317", "loc318", "loc401", "loc402", "loc403", "loc404", "loc411", "loc412", "loc413", "loc414", "loc415", "loc416", "loc417", "loc418", "loc22", "loc23", "loc24", "loc25", "loc32", "loc33", "loc34", "loc35", "loc42", "loc43", "loc44", "loc45", "loc52", "loc53", "loc54", "loc55"] 
    if no_players == 2
      self.place_pawns("red", locs)
      self.place_pawns("blue", locs)
      self.populate_deck("red", locs)
      self.populate_deck("blue", locs)
      self.close_camp("green", locs)
      self.close_camp("yellow", locs)
      self.clear_field(locs)
    elsif no_players == 3
      self.place_pawns("red", locs)
      self.place_pawns("blue", locs)
      self.place_pawns("green", locs)
      self.populate_deck("red", locs)
      self.populate_deck("blue", locs)
      self.populate_deck("green", locs)
      self.close_camp("yellow", locs)
      self.clear_field(locs)
    elsif no_players == 4
      self.place_pawns("red", locs)
      self.place_pawns("blue", locs)
      self.place_pawns("green", locs)
      self.place_pawns("yellow", locs)
      self.populate_deck("red", locs)
      self.populate_deck("blue", locs)
      self.populate_deck("green", locs)
      self.populate_deck("yellow", locs)
      self.clear_field(locs)
    end
  end

  def place_pawns(color, locations)
    if color == "red"
      locations[0..3].each{|loc| self.update( loc => "rp" )}
    elsif color == "blue"
      locations[4..7].each{|loc| self.update( loc => "bp" )}
    elsif color == "green"
      locations[8..11].each{|loc| self.update( loc => "gp" )}
    else
      locations[12..15].each{|loc| self.update( loc => "yp" )}
    end
  end

  def close_camp(color, locations)
    if color == "green"
      locations[8..11].each{|loc| self.update( loc => "xx" )}
    else
      locations[12..15].each{|loc| self.update( loc => "xx" )}
    end
  end

  def populate_deck(color, locations)
    if color == "red"
      pieces = [ "rp", "rp", "rp", "rp", "rr", "rr", "rn", "rn", "rb", "rb", "rk", "rq"]
      locations[16..27].each{|loc|
        piece = pieces.sample
        self.update( loc => piece )
        pieces.delete_at(pieces.index(piece) || pieces.length)
      }
    elsif color == "blue"
      pieces = [ "bp", "bp", "bp", "bp", "br", "br", "bn", "bn", "bb", "bb", "bk", "bq"]
      locations[28..39].each{|loc|
        piece = pieces.sample
        self.update( loc => piece )
        pieces.delete_at(pieces.index(piece) || pieces.length)
      }
    elsif color == "green" 
      pieces = [ "gp", "gp", "gp", "gp", "gr", "gr", "gn", "gn", "gb", "gb", "gk", "gq"]
      locations[40..51].each{|loc|
        piece = pieces.sample
        self.update( loc => piece )
        pieces.delete_at(pieces.index(piece) || pieces.length)
      }
    else
      pieces = [ "yp", "yp", "yp", "yp", "yr", "yr", "yn", "yn", "yb", "yb", "yk", "yq"]
      locations[52..63].each{|loc|
        piece = pieces.sample
        self.update( loc => piece )
        pieces.delete_at(pieces.index(piece) || pieces.length)
      }
    end
  end

  def clear_field(locations)
    locations[64..79].each{|loc|
      self.update( loc => nil )
    }
  end

end