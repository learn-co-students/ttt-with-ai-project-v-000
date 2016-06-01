class Player::Computer < Player
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  attr_accessor :valid_moves, :board, :save_token, :save_position, :save_open_combos



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
    #start by seeing if player can win. if win is not possible, check
    #to see if you should block opponent's win
    two_in_a_row?
    # if two_in_a_row is nil, then move to forking strategy.

    # token = nil
    # move_to = nil
    # if two_in_a_row != []
    #   if two_in_a_row.count == 1
    #     two_in_a_row.flatten
    #     two_in_a_row.each do |position|
    #       if self.board.cells[position] == "X" || self.board.cells[position] == "0"
    #         token = self.board.cells[position]
    #       else
    #         move_to = position
    #       end
    #     end
    #     if two_in_a_row.count == 2
    #       two_in_a_row.each do |win_combo|
    #   end
  end

  def two_in_a_row?
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
      end
    end
    if @save_position == nil
      #only block the opponent if player cannot win, if there are more than
      #two ways opponent can win, does not matter - so just pick one to block,
      #no need to save multiples
      #however, is there an optimal location?
      self.save_open_combos.each do |combo, tokens|
        @save_position = combo[tokens.index(" ")] + 1
        @save_position = @save_position.to_s
      end
    end
  end
end


# Quote from Wikipedia (Tic Tac Toe#Strategy)
#
# A player can play a perfect game of Tic-tac-toe (to win or, at least, draw) if they choose the first available move from the following list, each turn, as used in Newell and Simon's 1972 tic-tac-toe program.[6]
#
# Win: If you have two in a row, play the third to get three in a row.
# Block: If the opponent has two in a row, play the third to block them.
# Fork: Create an opportunity where you can win in two ways.
# Block Opponent's Fork:
#
# Option 1: Create two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork or winning. For example, if "X" has a corner, "O" has the center, and "X" has the opposite corner as well, "O" must not play a corner in order to win. (Playing a corner in this scenario creates a fork for "X" to win.)
#
# Option 2: If there is a configuration where the opponent can fork, block that fork.
# Center: Play the center.
# Opposite Corner: If the opponent is in the corner, play the opposite corner.
# Empty Corner: Play an empty corner.
# Empty Side: Play an empty side.


#
# def won?
#   won = false
#   WIN_COMBINATIONS.each_with_index do |win_combo, index|
#     if self.board.cells[win_combo[0]] == self.board.cells[win_combo[1]] && self.board.cells[win_combo[0]] == self.board.cells[win_combo[2]] && self.board.cells[win_combo[2]] == self.board.cells[win_combo[2]] && self.board.cells[win_combo[0]] != " "
#       won = true
#       self.save_winner = self.board.cells[win_combo[0]]
#     end
#   end
#   won
# end
