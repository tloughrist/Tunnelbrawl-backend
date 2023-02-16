class Board < ApplicationRecord

  belongs_to :game
  has_many :players, through: :game

  def empty
    locs = ["loc21", "loc31", "loc41", "loc51", "loc26", "loc36", "loc46", "loc56", "loc12", "loc13", "loc14", "loc15", "loc62", "loc63", "loc64", "loc65", "loc101", "loc102", "loc103", "loc104", "loc111", "loc112", "loc113", "loc114", "loc115", "loc116", "loc117", "loc118", "loc201", "loc202", "loc203", "loc204", "loc211", "loc212", "loc213", "loc214", "loc215", "loc216", "loc217", "loc218", "loc301", "loc302", "loc303", "loc304", "loc311", "loc312", "loc313", "loc314", "loc315", "loc316", "loc317", "loc318", "loc401", "loc402", "loc403", "loc404", "loc411", "loc412", "loc413", "loc414", "loc415", "loc416", "loc417", "loc418", "loc22", "loc23", "loc24", "loc25", "loc32", "loc33", "loc34", "loc35", "loc42", "loc43", "loc44", "loc45", "loc52", "loc53", "loc54", "loc55" ]
    locs.each {|loc| self.update( loc => "em_s_highlight--none" )}   
  end
  
  def begin_game(no_players)
    locs = ["loc21", "loc31", "loc41", "loc51", "loc26", "loc36", "loc46", "loc56", "loc12", "loc13", "loc14", "loc15", "loc62", "loc63", "loc64", "loc65", "loc101", "loc102", "loc103", "loc104", "loc111", "loc112", "loc113", "loc114", "loc115", "loc116", "loc117", "loc118", "loc201", "loc202", "loc203", "loc204", "loc211", "loc212", "loc213", "loc214", "loc215", "loc216", "loc217", "loc218", "loc301", "loc302", "loc303", "loc304", "loc311", "loc312", "loc313", "loc314", "loc315", "loc316", "loc317", "loc318", "loc401", "loc402", "loc403", "loc404", "loc411", "loc412", "loc413", "loc414", "loc415", "loc416", "loc417", "loc418", "loc22", "loc23", "loc24", "loc25", "loc32", "loc33", "loc34", "loc35", "loc42", "loc43", "loc44", "loc45", "loc52", "loc53", "loc54", "loc55" ] 
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
      locations[0..3].each{|loc| self.update( loc => "rp_s_highlight--none" )}
    elsif color == "blue"
      locations[4..7].each{|loc| self.update( loc => "bp_s_highlight--none" )}
    elsif color == "green"
      locations[8..11].each{|loc| self.update( loc => "gp_s_highlight--none" )}
    else
      locations[12..15].each{|loc| self.update( loc => "yp_s_highlight--none" )}
    end
  end

  def close_camp(color, locations)
    if color == "green"
      locations[8..11].each{|loc| self.update( loc => "xx_s_highlight--none" )}
    else
      locations[12..15].each{|loc| self.update( loc => "xx_s_highlight--none" )}
    end
  end

  def populate_deck(color, locations)
    if color == "red"
      pieces = ["rp_s_highlight--none", "rp_s_highlight--none", "rp_s_highlight--none", "rp_s_highlight--none", "rr_s_highlight--none", "rr_s_highlight--none", "rn_s_highlight--none", "rn_s_highlight--none", "rb_s_highlight--none", "rb_s_highlight--none", "rk_s_highlight--none", "rq_s_highlight--none"]
      locations[16..27].each{|loc|
        piece = pieces.sample
        self.update( loc => piece )
        pieces.delete_at(pieces.index(piece) || pieces.length)
      }
    elsif color == "blue"
      pieces = ["bp_s_highlight--none", "bp_s_highlight--none", "bp_s_highlight--none", "bp_s_highlight--none", "br_s_highlight--none", "br_s_highlight--none", "bn_s_highlight--none", "bn_s_highlight--none", "bb_s_highlight--none", "bb_s_highlight--none", "bk_s_highlight--none", "bq_s_highlight--none"]
      locations[28..39].each{|loc|
        piece = pieces.sample
        self.update( loc => piece )
        pieces.delete_at(pieces.index(piece) || pieces.length)
      }
    elsif color == "green" 
      pieces = ["gp_s_highlight--none", "gp_s_highlight--none", "gp_s_highlight--none", "gp_s_highlight--none", "gr_s_highlight--none", "gr_s_highlight--none", "gn_s_highlight--none", "gn_s_highlight--none", "gb_s_highlight--none", "gb_s_highlight--none", "gk_s_highlight--none", "gq_s_highlight--none"]
      locations[40..51].each{|loc|
        piece = pieces.sample
        self.update( loc => piece )
        pieces.delete_at(pieces.index(piece) || pieces.length)
      }
    else
      pieces = ["yp_s_highlight--none", "yp_s_highlight--none", "yp_s_highlight--none", "yp_s_highlight--none", "yr_s_highlight--none", "yr_s_highlight--none", "yn_s_highlight--none", "yn_s_highlight--none", "yb_s_highlight--none", "yb_s_highlight--none", "yk_s_highlight--none", "yq_s_highlight--none"]
      locations[52..63].each{|loc|
        piece = pieces.sample
        self.update( loc => piece )
        pieces.delete_at(pieces.index(piece) || pieces.length)
      }
    end
  end

  def clear_field(locations)
    locations[64..].each{|loc|
      self.update( loc => "em_s_highlight--none" )
    }
  end

  def legal_moves(piece_loc)
    active_space = self.attributes.select {|k,v| k.to_s == piece_loc}
    active_loc = active_space.keys.map {|key| key.to_s[3..6]}[0].to_i
    active_piece = active_space.values.map {|value| value.to_s[0..1]}[0]
    active_status = active_space.values.map {|value| value.to_s[3]}[0]
    
    def slide(start, disp, color)
      pos = start
      move_array = []
      capture_array = []
      while in_bounds(pos + disp) && !occupied(pos + disp)  do
        move_array << pos + disp
        pos +=disp
      end
      if in_bounds(pos + disp) && opponent(pos + disp, color)
        capture_array << pos + disp
      end
      {moves: move_array, captures: capture_array}      
    end

    def pawn_slide(start, disp, color)
      pos = start
      move_array = []
      capture_array = []
      2.times {
        if in_bounds(pos + disp) && !occupied(pos + disp)
          move_array << pos + disp
          pos +=disp
        end
      }
      capture_array = pawn_capture(start, color)
      {moves: move_array, captures: capture_array}      
    end

    def step(start, disp, color)
      pos = start
      move_array = []
      capture_array = []
      if in_bounds(pos + disp) && !occupied(pos + disp)
        move_array << pos + disp
      elsif in_bounds(pos + disp) && opponent(pos + disp, color)
        capture_array << pos + disp
      end
      {moves: move_array, captures: capture_array}
    end

    def pawn_step(start, disp, color)
      pos = start
      move_array = []
      if in_bounds(pos + disp) && !occupied(pos + disp)
        move_array << pos + disp
      else
        capture_array = pawn_capture(start, color)
      end
      {moves: move_array, captures: capture_array}
    end

    def pawn_capture(start, color)
      pawn_captures = [start - 11, start - 9, start + 9, start + 11]
      capture_array = []
      pawn_captures.each do |loc|
        if in_bounds(loc) && opponent(loc, color)
          capture_array << loc
        end
      end
      capture_array
    end

    def occupied(loc)
      loc_key = "loc#{loc.to_s}"
      target_space = self[loc_key.to_sym]
      if target_space[0..1] == "em"
        false
      else
        true
      end
    end

    def opponent(loc, color)
      loc_key = "loc#{loc.to_s}"
      target_space = self[loc_key.to_sym]
      target_space[0] != "e" && target_space[0] != color
    end
    
    def in_bounds(loc)
      (loc > 11 && loc < 16) || (loc > 20 && loc < 27) || (loc > 30 && loc < 37) || (loc > 40 && loc < 47) || (loc > 50 && loc < 57) || (loc > 61 && loc < 66)
    end

    def move(start, color, disp_arr, move_func)
      moves_array = []
      captures_array = []
      if move_func == "step"
        disp_arr.each do |disp|
          step_hsh = step(start, disp, color)
          step_hsh[:moves].each {|move| moves_array << "loc#{move.to_s}"}
          step_hsh[:captures].each {|capture| captures_array << "loc#{capture.to_s}"}
        end
      elsif move_func == "slide"
        disp_arr.each do |disp|
          slide_hsh = slide(start, disp, color)
          slide_hsh[:moves].each {|move| moves_array << "loc#{move.to_s}"}
          slide_hsh[:captures].each {|capture| captures_array << "loc#{capture.to_s}"}
        end
      else
        disp_arr.each do |disp|
          pslide_hsh = pawn_slide(start, disp, color)
          pslide_hsh[:moves].each {|move| moves_array << "loc#{move.to_s}"}
          pslide_hsh[:captures].each {|capture| captures_array << "loc#{capture.to_s}"}
        end
      end
      {moves: moves_array.uniq, captures: captures_array.uniq}
    end

    def pawn_move(start, color, disp_arr, active_status)
      if active_status == "s"
        move(start, color, disp_arr, "pawn_slide")
      else
        move(start, color, disp_arr, "step")
      end
    end

    def rook(start, color)
      disp_arr = [-10, 10, -1, 1]
      move(start, color, disp_arr, "slide")
    end

    def knight(start, color)
      disp_arr = [-12, -8, -21, -18, 12, 8, 21, 18]
      move(start, color, disp_arr, "step")
    end

    def bishop(start, color)
      disp_arr = [-11, 11, -9, 9]
      move(start, color, disp_arr, "slide")
    end

    def queen(start, color)
      disp_arr = [-11, 11, -9, 9, -10, 10, -1, 1]
      move(start, color, disp_arr, "slide")
    end

    def king(start, color)
      disp_arr = [-11, 11, -9, 9, -10, 10, -1, 1]
      move(start, color, disp_arr, "step")
    end

    def pawn(start, color, active_status)
      red_disp_arr = [-10, 1, 10]
      green_disp_arr = [-1, 10, 1]
      blue_disp_arr = [-10, -1, 10]
      yellow_disp_arr = [-1, -10, 1]
      case color
      when "r"
        pawn_move(start, color, red_disp_arr, active_status)
      when "g"
        pawn_move(start, color, green_disp_arr, active_status)
      when "b"
        pawn_move(start, color, blue_disp_arr, active_status)
      when "y"
        pawn_move(start, color, yellow_disp_arr, active_status)
      else
        puts("error: wrong color code")
      end
    end

    def move_piece(active_loc, active_piece, active_status)
      case active_piece[1]
      when "r"
        rook(active_loc, active_piece[0])
      when "n"
        knight(active_loc, active_piece[0])
      when "b"
        bishop(active_loc, active_piece[0])
      when "q"
        queen(active_loc, active_piece[0])
      when "k"
        king(active_loc, active_piece[0])
      when "p"
        pawn(active_loc, active_piece[0], active_status)
      else
        puts("error: wrong piece code")
      end
    end
 
    legal_hsh = move_piece(active_loc, active_piece, active_status)

    legal_moves_keys = legal_hsh[:moves].map {|move| move.to_sym}
    legal_captures_keys = legal_hsh[:captures].map {|capture| capture.to_sym}
    
    legal_moves_keys.each {|key| self.update(self[:key] => "#{self[:key].to_s[0..15]}move")}
    legal_captures_keys.each {|key| self.update(self[:key] => "#{self[:key].to_s[0..15]}capture")}

    legal_hsh
  end

  def clear
    target_spaces = self.attributes.select {|k,v| v.to_s[16..-1] == "active" || v.to_s[16..-1] == "move" || v.to_s[16..-1] == "capture"}
    cleared_spaces = target_spaces.each {|k,v| v[16..-1] = "none"}
    cleared_spaces.each {|space| self.update(space)}
    self
  end

  def move(start_loc, end_loc)
    legal_moves = *self.legal_moves(start_loc)[:moves], *self.legal_moves(start_loc)[:captures]
    self.clear
    if legal_moves.include?(end_loc)
      active_piece = self.attributes.select {|k,v| k.to_s == start_loc}
      target = self.attributes.select {|k,v| k.to_s == end_loc}
      self.capture(target[end_loc])
      active_content = active_piece[start_loc]
      active_content["_s_"] = "_a_"
      target[end_loc] = active_content
      active_piece[start_loc] = "em_s_highlight--none"
      self.update(active_piece)
      self.update(target)
      #camp = self.camp.select {|k,v| v == "em_s_highlight--none"} 
      #if camp.size == 0
      #  self.game.advance
      #end
    else
      puts("error: illegal move")
    end
  end

  def capture(piece)
    puts piece
    game = self.game
    if piece != "em_s_highlight--none"
      def bury(color)
        graves = self["#{color}_taken".to_sym]
        graves << piece
        self["#{color}_taken".to_sym] = graves
      end
      case game[:turn]
      when "red"
        bury("red")
      when "green"
        bury("green")
      when "blue"
        bury("blue")
      when "yellow"
        bury("yellow")
      end
    else
      piece
    end
    if piece[1] == "k"
      self.king
    end
  end

  def king
    puts("take queen")
  end

  def show_placement(piece_loc)
    if self.is_hand?(piece_loc)
      empties = self.camp.select {|k,v| v.to_s[0..1] == "em"}
      highlit_empties = empties.each {|k,v| v = "#{v.to_s[0..15]}move"}
      highlit_empties.each {|hash| self.update(hash)}
      open_locs = empties.keys
    else
      puts("error: move phase ended; place piece from hand")
    end
  end

  def place(start_loc, end_loc)
    if show_placement(start_loc).include?(end_loc.to_sym)
      active_piece = self.attributes.select {|k,v| k.to_s == start_loc}
      target = self.attributes.select {|k,v| k.to_s == end_loc}
      active_content = active_piece[start_loc]
      target[end_loc] = active_content
      self.update(active_piece)
      self.update(target)
      draw(start_loc)
      self
    else
      puts("error: illegal placement")
    end

  end

  def is_hand?(loc)
    color = self.game[:turn]
    case color
    when "red"
      ["loc101", "loc102", "loc103", "loc104"].include?(loc)
    when "green"
      ["loc201", "loc202", "loc203", "loc204"].include?(loc)
    when "blue"
      ["loc301", "loc302", "loc303", "loc304"].include?(loc)
    when "yellow"
      ["loc401", "loc402", "loc403", "loc404"].include?(loc)
    end
  end

  def camp
    color = self.game[:turn]
    case color
    when "red"
      self.slice(:loc21, :loc31, :loc41, :loc51)
    when "green"
      self.slice(:loc12, :loc13, :loc14, :loc15)
    when "blue"
      self.slice(:loc26, :loc36, :loc46, :loc56)
    when "yellow"
      self.slice(:loc62, :loc63, :loc64, :loc65)
    end
  end

  def deck
    color = self.game[:turn]
    case color
    when "red"
      self.slice(:loc111, :loc112, :loc113, :loc114, :loc115, :loc116, :loc117, :loc118)
    when "green"
      self.slice(:loc211, :loc212, :loc213, :loc214, :loc215, :loc216, :loc217, :loc218)
    when "blue"
      self.slice(:loc311, :loc312, :loc313, :loc314, :loc315, :loc316, :loc317, :loc318)
    when "yellow"
      self.slice(:loc411, :loc412, :loc413, :loc414, :loc415, :loc416, :loc417, :loc418)
    end
  end

  def draw(loc)
    remaining_cards = self.deck.select {|k,v| v.to_s[0..1] != "em"}
    drawn = remaining_cards[remaining_cards.keys[0].to_sym]
    self[remaining_cards.keys[0].to_sym] = "em_s_highlight--none"
    self[loc.to_sym] = drawn
    self
  end

end