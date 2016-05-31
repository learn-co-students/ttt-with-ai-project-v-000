class Player::Computer < Player
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  attr_accessor :valid_moves, :board

  def move(board)
    puts "Computer #{self.token}'s turn!\n\n"
    @valid_moves = []
    @board = board
    board.cells.each_with_index do |cell, index|
      @valid_moves << index.to_s if board.valid_move?(index.to_s)
    end
    ai_move
  end

  def ai_move
    two_in_a_row
  end

  def two_in_a_row
        binding.pry
    save_combos = []
    WIN_COMBINATIONS.each do |win_combo|
      uneven_true = (board[win_combo[0]] == " ") ^ (board[win_combo[1]] == " ") ^ (board[win_combo[2]] == " ")
      max_one_true = (!((board[win_combo[0]] == " ") && (board[win_combo[1]] == " "))) && (!((board[win_combo[0]] == " ") && (board[win_combo[2]] == " "))) && (!((board[win_combo[2]] == " ") && (board[win_combo[1]] == " ")))
      exactly_one_true = uneven_true && max_one_true
      save_combos << win_combo if exactly_one_true
    end
    save_open_combos = []
    save_combos.each do |combo|
      if board[combo[0]] == board[combo[1]] || board[combo[0]] == board[combo[2]] || board[combo[2]] == board[combo[1]]
        save_open_combos << combo
      end
    end
    save_open_combos   
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
