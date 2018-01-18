require 'pry'
require_relative '../players/human.rb'
require_relative '../game.rb'
require_relative '../board.rb'
require_relative '../player.rb'

module Players
  class Computer < Player

    WIN_COMBOS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    def move(board, delay = 0.25)
      # play a winning move
      if self.winning_move(board, self.token) != nil
        choice = self.winning_move(board, self.token) + 1
      # play to counter an opponent's winning move
      elsif self.winning_move(board, self.opponent_token) != nil
        choice = self.winning_move(board, self.opponent_token) + 1
      # play in the center
      elsif board.open?(5)
        choice = 5
      # play in a corner opposite an opponent's token
      elsif self.opposite_corner(board) != nil
        choice = self.opposite_corner(board)
      # play in any open corner
      elsif self.open_corner(board) != nil
        choice = self.open_corner(board)
      # play in the middle square of any side
      elsif self.middle_square(board) != nil
        choice = self.middle_square(board)
      # failsafe - play a random spot
      else
        choice = (rand*9).ceil
          until board.open?(choice) do
            choice = (rand*9).ceil
          end
      end
      puts "The computer (#{self.token}) would like to take spot #{choice}"
      sleep(delay)
      "#{choice}"
    end

    # looks at the possible plays wehre the opponent's token is in a corner and the opposite corner is open, and choses one at random.
    def opposite_corner(board)
    #NOTE this could be cleaned up further with a function that accepts two arguments ie opposite_corner_play(0,9) and then iterating over an array of corners with it...but I'm not going to do that right now.
      # NOTE opponent_in_cell opperates on indexes, board.open? operates on inputs. return is an input.
      opposite_corners = []
      opposite_corners << 9 if opponent_in_cell(0, board) && board.open?(9) # cell 8
      opposite_corners << 7 if opponent_in_cell(2, board) && board.open?(7) # cell 6
      opposite_corners << 3 if opponent_in_cell(6, board) && board.open?(3) # cell 2
      opposite_corners << 1 if opponent_in_cell(8, board) && board.open?(1) # cell 0
      self.rand_from_array(opposite_corners)
    end

    # looks at all open corners, and chooses one at random
    def open_corner(board)
    # NOTE this could be cleaned up further.
      open_corners = []
      open_corners << 1 if board.open?(1)
      open_corners << 3 if board.open?(3)
      open_corners << 7 if board.open?(7)
      open_corners << 9 if board.open?(9)
      self.rand_from_array(open_corners)
    end

    # looks at all middle squares and chooses one at random
    def middle_square(board)
    # NOTE this could be cleaned up further.
      middle_squares = []
      middle_squares << 2 if board.open?(2)
      middle_squares << 6 if board.open?(6)
      middle_squares << 8 if board.open?(8)
      middle_squares << 4 if board.open?(4)
      self.rand_from_array(middle_squares)
    end

    # chooses a random item from an array.
    def rand_from_array(array)
      array[(array.size*rand).floor]
    end

    # determines based on an index number and board, whether the opponent's token is in a cell
    def opponent_in_cell(index, board)
      board.cells[index.to_i] == self.opponent_token
    end

    # given an array with line indexes ([0,1,2] for example), returns an array of the tokens in that line, ie [" ", "X", " "]
    def tokens_in_line(board, line)
      line_tokens = line.collect {|index| board.cells[index.to_i]}
    end

    # returns the opponent's token
    def opponent_token
      if self.token == "X"
        "O"
      else
        "X"
      end
    end

    # looks at all WIN_COMBOS, finds one where two out of three tokens match the given token argument, returns the empty index in that win combo that should be played either to win or to thwart a win
    def winning_move(board, token) # this method should return the index to be played
      winning_line = WIN_COMBOS.detect {|combo| tokens_in_line(board, combo).sort == [" ", token, token]} #winning_line should be something like [2,5,8] or nil
      # find the first empty cell in the winning_line array
      if winning_line != nil
        winning_line.find do |index|
          board.cells[index.to_i] != token
        end
      end
    end

  end # class end
end # module end

# 1. DONE - check all WIN_CONDITIONS - if any win condition has two of my token, play in the empty spot.
# 2. DONE -check all WIN_CONDITIONS - if any win condition has two of the opponent token, play in the empty spot.
# FORK logic appears to be unnecessary given other rules.
  # 3. if both legs of any FORK have no characters of my opponent's token AND each leg of the fork has one character of my token NOT in the crook, play in the fork's crook
  # 4. if both legs of any FORK have no characters of my token, AND each leg of the fork has one or more characters of my opponent's token,
  # 4a. check if any WIN_CONDITIONS has one of my token and none of the opponent's token, and play in an open space in that WIN_CONDITION
  # 4b. Play in the crook of the fork, OR that spot is taken, play in any open space in either leg of the fork
# 5. DONE - Play in the center
# 6. DONE - if my opponent's token is in a corner and the opposite corner is open, play in the opposite corner
# 7. DONE - play in any open corner
# 8. DONE - play in the middle square of any side
