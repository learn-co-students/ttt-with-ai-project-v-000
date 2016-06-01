class Player::Computer < Player

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  attr_accessor :valid_moves, :board, :save_token, :save_position, :save_open_combos, :save_two_in_a_row



  def move(board)
    puts "Computer #{self.token}'s turn!\n\n"
    @save_position = nil
    @board = board
    @save_open_combos = {}
    ai_move
    @save_position = board.valid_moves[0] if @save_position == nil
    @save_position
  end

  def ai_move
    #consider turn count and then pick strategy
    case self.board.turn_count
      when 0
        #if you are the first player, select the middle,
        #I chose center to be the first choice here, hoping opponent may chose edge
        @save_position = "5"
      when 1
        # check if opponent placed token on edge, if so, call edge to place token
        # on one of the two corners furthest from edge piece. If no edge move,
        # either take the center if it is open or
        # if the center is not open take a corner
        if self.board.valid_move?("5")
          @save_position = "5"
        elsif !edge?
          @save_position = "1" if self.board.valid_move?("1")
        end
        # if you are on the third turn, check if your opponent took an edge
        # if opponent takes an edge, set up a win by placing token on two corners
        # furthest from edge piece. If no edge move,
      when 2
        corners if !edge?
      else
        two_in_a_row?
    end

  end

  def corners
    self.save_position = "9" if self.board.valid_move?("9")
    self.save_position = "7" if self.board.valid_move?("7")
    self.save_position = "3" if self.board.valid_move?("3")
    self.save_position = "1" if self.board.valid_move?("1")
    self.save_position = "5" if self.board.valid_move?("5")
  end


  def edge?
    edge = false
    if self.board.taken?("2")
      self.save_position = "9" if self.board.valid_move?("9")
      self.save_position = "7" if self.board.valid_move?("7")
      edge = true
    elsif self.board.taken?("4")
      self.save_position = "3" if self.board.valid_move?("3")
      self.save_position = "9" if self.board.valid_move?("9")
      edge = true
    elsif self.board.taken?("6")
      self.save_position = "1" if self.board.valid_move?("1")
      self.save_position = "7" if self.board.valid_move?("7")
      edge = true
    elsif self.board.taken?("8")
      self.save_position = "1" if self.board.valid_move?("1")
      self.save_position = "3" if self.board.valid_move?("3")
      edge = true
    end
    edge
  end




  def two_in_a_row?
    self.save_two_in_a_row = false
    save_combos = []
    WIN_COMBINATIONS.each do |win_combo|
      uneven_true = (self.board.cells[win_combo[0]] == " ") ^ (self.board.cells[win_combo[1]] == " ") ^ (self.board.cells[win_combo[2]] == " ")
      max_one_true = (!((self.board.cells[win_combo[0]] == " ") && (self.board.cells[win_combo[1]] == " "))) && (!((self.board.cells[win_combo[0]] == " ") && (self.board.cells[win_combo[2]] == " "))) && (!((self.board.cells[win_combo[2]] == " ") && (self.board.cells[win_combo[1]] == " ")))
      exactly_one_true = uneven_true && max_one_true
      save_combos << win_combo if exactly_one_true
    end
    save_combos.each do |combo|
      if self.board.cells[combo[0]] == self.board.cells[combo[1]] || self.board.cells[combo[0]] == self.board.cells[combo[2]] || self.board.cells[combo[2]] == self.board.cells[combo[1]]
        #build a hash with win combo as key and tokens as value
        self.save_open_combos[combo] = [self.board.cells[combo[0]], self.board.cells[combo[1]], self.board.cells[combo[2]] ]
      end
    end
    #call win_or_defend to check save_open_combos to see if current player can win
    # if player can't win block opponent
    win_or_defend
  end

  def win_or_defend
    self.save_open_combos.each do |combo, tokens|
      #if the two combo is player's token, place the move in the winning location
      if tokens.include?(self.token)
        @save_position = combo[tokens.index(" ")] + 1
        @save_position = @save_position.to_s
        self.save_two_in_a_row = true
      end
    end
    if @save_position == nil
      #only block the opponent if player cannot win, if there are more than
      #two ways opponent can win, does not matter - so just pick one to block,
      #no need to save multiples
      self.save_open_combos.each do |combo, tokens|
        @save_position = combo[tokens.index(" ")] + 1
        @save_position = @save_position.to_s
        self.save_two_in_a_row = true
      end
    end
  end
end
