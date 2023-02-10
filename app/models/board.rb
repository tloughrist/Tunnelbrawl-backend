class Board < ApplicationRecord

  belongs_to :game
  has_many :players, through: :game

  def empty
    locs = ["loc21", "loc31", "loc41", "loc51", "loc26", "loc36", "loc46", "loc56", "loc12", "loc13", "loc14", "loc15", "loc62", "loc63", "loc64", "loc65", "loc101", "loc102", "loc103", "loc104", "loc111", "loc112", "loc113", "loc114", "loc115", "loc116", "loc117", "loc118", "loc201", "loc202", "loc203", "loc204", "loc211", "loc212", "loc213", "loc214", "loc215", "loc216", "loc217", "loc218", "loc301", "loc302", "loc303", "loc304", "loc311", "loc312", "loc313", "loc314", "loc315", "loc316", "loc317", "loc318", "loc401", "loc402", "loc403", "loc404", "loc411", "loc412", "loc413", "loc414", "loc415", "loc416", "loc417", "loc418", "loc22", "loc23", "loc24", "loc25", "loc32", "loc33", "loc34", "loc35", "loc42", "loc43", "loc44", "loc45", "loc52", "loc53", "loc54", "loc55", "loc121", "loc122", "loc123", "loc124", "loc125", "loc126", "loc127", "loc128", "loc129", "loc130", "loc131", "loc132", "loc133", "loc134", "loc135","loc136", "loc221", "loc222", "loc223", "loc224", "loc225", "loc226", "loc227", "loc228", "loc229", "loc230", "loc231", "loc232", "loc233", "loc234", "loc235","loc236", "loc321", "loc322", "loc323", "loc324", "loc325", "loc326", "loc327", "loc328", "loc329", "loc330", "loc331", "loc332", "loc333", "loc334", "loc335","loc336", "loc421", "loc422", "loc423", "loc424", "loc425", "loc426", "loc427", "loc428", "loc429", "loc430", "loc431", "loc432", "loc433", "loc434", "loc435","loc436"]
    locs.each {|loc| self.update( loc => "em_highlight--none" )}   
  end
  
  def begin_game(no_players)
    locs = ["loc21", "loc31", "loc41", "loc51", "loc26", "loc36", "loc46", "loc56", "loc12", "loc13", "loc14", "loc15", "loc62", "loc63", "loc64", "loc65", "loc101", "loc102", "loc103", "loc104", "loc111", "loc112", "loc113", "loc114", "loc115", "loc116", "loc117", "loc118", "loc201", "loc202", "loc203", "loc204", "loc211", "loc212", "loc213", "loc214", "loc215", "loc216", "loc217", "loc218", "loc301", "loc302", "loc303", "loc304", "loc311", "loc312", "loc313", "loc314", "loc315", "loc316", "loc317", "loc318", "loc401", "loc402", "loc403", "loc404", "loc411", "loc412", "loc413", "loc414", "loc415", "loc416", "loc417", "loc418", "loc22", "loc23", "loc24", "loc25", "loc32", "loc33", "loc34", "loc35", "loc42", "loc43", "loc44", "loc45", "loc52", "loc53", "loc54", "loc55", "loc121", "loc122", "loc123", "loc124", "loc125", "loc126", "loc127", "loc128", "loc129", "loc130", "loc131", "loc132", "loc133", "loc134", "loc135","loc136", "loc221", "loc222", "loc223", "loc224", "loc225", "loc226", "loc227", "loc228", "loc229", "loc230", "loc231", "loc232", "loc233", "loc234", "loc235","loc236", "loc321", "loc322", "loc323", "loc324", "loc325", "loc326", "loc327", "loc328", "loc329", "loc330", "loc331", "loc332", "loc333", "loc334", "loc335","loc336", "loc421", "loc422", "loc423", "loc424", "loc425", "loc426", "loc427", "loc428", "loc429", "loc430", "loc431", "loc432", "loc433", "loc434", "loc435","loc436"] 
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
      locations[0..3].each{|loc| self.update( loc => "rp_highlight--none" )}
    elsif color == "blue"
      locations[4..7].each{|loc| self.update( loc => "bp_highlight--none" )}
    elsif color == "green"
      locations[8..11].each{|loc| self.update( loc => "gp_highlight--none" )}
    else
      locations[12..15].each{|loc| self.update( loc => "yp_highlight--none" )}
    end
  end

  def close_camp(color, locations)
    if color == "green"
      locations[8..11].each{|loc| self.update( loc => "xx_highlight--none" )}
    else
      locations[12..15].each{|loc| self.update( loc => "xx_highlight--none" )}
    end
  end

  def populate_deck(color, locations)
    if color == "red"
      pieces = ["rp_highlight--none", "rp_highlight--none", "rp_highlight--none", "rp_highlight--none", "rr_highlight--none", "rr_highlight--none", "rn_highlight--none", "rn_highlight--none", "rb_highlight--none", "rb_highlight--none", "rk_highlight--none", "rq_highlight--none"]
      locations[16..27].each{|loc|
        piece = pieces.sample
        self.update( loc => piece )
        pieces.delete_at(pieces.index(piece) || pieces.length)
      }
    elsif color == "blue"
      pieces = ["bp_highlight--none", "bp_highlight--none", "bp_highlight--none", "bp_highlight--none", "br_highlight--none", "br_highlight--none", "bn_highlight--none", "bn_highlight--none", "bb_highlight--none", "bb_highlight--none", "bk_highlight--none", "bq_highlight--none"]
      locations[28..39].each{|loc|
        piece = pieces.sample
        self.update( loc => piece )
        pieces.delete_at(pieces.index(piece) || pieces.length)
      }
    elsif color == "green" 
      pieces = ["gp_highlight--none", "gp_highlight--none", "gp_highlight--none", "gp_highlight--none", "gr_highlight--none", "gr_highlight--none", "gn_highlight--none", "gn_highlight--none", "gb_highlight--none", "gb_highlight--none", "gk_highlight--none", "gq_highlight--none"]
      locations[40..51].each{|loc|
        piece = pieces.sample
        self.update( loc => piece )
        pieces.delete_at(pieces.index(piece) || pieces.length)
      }
    else
      pieces = ["yp_highlight--none", "yp_highlight--none", "yp_highlight--none", "yp_highlight--none", "yr_highlight--none", "yr_highlight--none", "yn_highlight--none", "yn_highlight--none", "yb_highlight--none", "yb_highlight--none", "yk_highlight--none", "yq_highlight--none"]
      locations[52..63].each{|loc|
        piece = pieces.sample
        self.update( loc => piece )
        pieces.delete_at(pieces.index(piece) || pieces.length)
      }
    end
  end

  def clear_field(locations)
    locations[64..].each{|loc|
      self.update( loc => "em_highlight--none" )
    }
  end

end