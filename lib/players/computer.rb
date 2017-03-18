require 'pry'
require_relative '../players/human.rb'
require_relative '../game.rb'
require_relative '../board.rb'
require_relative '../player.rb'

module Players
  class Computer < Player

    WIN_COMBOS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    def move(board)
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
      # play a random spot
      else
        choice = (rand*9).ceil
          until board.open?(choice) do
            choice = (rand*9).ceil
          end
      end
      puts "The computer (#{self.token}) would like to take spot #{choice}"
      sleep(1)
      "#{choice}"
    end

    def opposite_corner(board)
    # create an array of posisble plays based on playing the opposite corner and choose one at random
    #NOTE this could be cleaned up further with a function that accepts two arguments ie opposite_corner_play(0,9) and then iterating over an array of corners with it...but I'm not going to do that right now.
      # NOTE opponent_in_cell opperates on indexes, board.open? operates on inputs. return is an input.
      opposite_corners = []
      opposite_corners << 9 if opponent_in_cell(0, board) && board.open?(9) # cell 8
      opposite_corners << 7 if opponent_in_cell(2, board) && board.open?(7) # cell 6
      opposite_corners << 3 if opponent_in_cell(6, board) && board.open?(3) # cell 2
      opposite_corners << 1 if opponent_in_cell(8, board) && board.open?(1) # cell 0
      self.rand_from_array(opposite_corners)
    end

    def open_corner(board)
      open_corners = []
      open_corners << 1 if board.open?(1)
      open_corners << 3 if board.open?(3)
      open_corners << 7 if board.open?(7)
      open_corners << 9 if board.open?(9)
      self.rand_from_array(open_corners)
    end

    def middle_square(board)
      middle_squares = []
      middle_squares << 2 if board.open?(2)
      middle_squares << 6 if board.open?(6)
      middle_squares << 8 if board.open?(8)
      middle_squares << 4 if board.open?(4)
      self.rand_from_array(middle_squares)
    end

    def rand_from_array(array)
      array[(array.size*rand).floor]
    end

    def opponent_in_cell(index, board)
      board.cells[index.to_i] == self.opponent_token
    end

    def tokens_in_line(board, line) # taking in a board and a line => line is [0,1,2] for example
      line_tokens = line.collect {|index| board.cells[index.to_i]}
    end # should return line_tokens, which looks like this: [" ", "X", " "]

    def opponent_token # returns the opponent's token
      if self.token == "X"
        "O"
      else
        "X"
      end
    end

    def winning_move(board, token) # this method should return the index to be played
      winning_line = WIN_COMBOS.detect {|combo| tokens_in_line(board, combo).sort == [" ", token, token]} #at this point winning_line should be something like [2,5,8] or nil
      # i want to find the first item in the winning_line array for which the board doesn't have an "X"
      if winning_line != nil
        winning_line.find do |index|
          board.cells[index.to_i] != token
        end
      end
    end # winning_move end # this should return an index to play.

  end # class end
end

# binding.pry

# win_combos = {a => [0,1,2], b => [3,4,5], c => [6,7,8], d => [0,3,6], e => [1,4,7], f => [2,5,8], g => [0,4,8], h => [2,4,6]}
#
# forks = {0 => [[a,d], [d,g], [a,g]], 1 => [a,e], 2 => [[a,f], [a,h], [f,h]], 3 => [d,b], 4 => [b,e], 5 => [f,b], 6 => [[d,c], [c,h], [d,h]], 7 => [c,e], 8 => [[c,f], [f,g], [c,g]]}

#                 D   E   F            G             H
#             A | 0 | 1 | 2 | A         | 0 | 1 | 2 |
#               -------------           -------------
#             B | 3 | 4 | 5 | B         | 3 | 4 | 5 |
#               -------------           -------------
#             C | 6 | 7 | 8 | C         | 6 | 7 | 8 |
#                 D   E   F            H             G

# 1. DONE - check all WIN_CONDITIONS - if any win condition has two of my token, play in the empty spot.
# 2. DONE -check all WIN_CONDITIONS - if any win condition has two of the opponent token, play in the empty spot.
# 3. if both legs of any FORK have no characters of my opponent's token AND each leg of the fork has one character of my token NOT in the crook, play in the fork's crook
# 4. if both legs of any FORK have no characters of my token, AND each leg of the fork has one or more characters of my opponent's token,
# 4a. check if any WIN_CONDITIONS has one of my token and none of the opponent's token, and play in an open space in that WIN_CONDITION
# 4b. Play in the crook of the fork, OR that spot is taken, play in any open space in either leg of the fork
# 5. DONE - Play in the center
# 6. DONE - if my opponent's token is in a corner and the opposite corner is open, play in the opposite corner
# 7. DONE - play in any open corner
# 8. DONE - play in the middle square of any side

# forks = {crook: [array of forks from that crook, each item is an index to a line in the fork]}

# RAW FORKS
# T forks (4)
# {1 => [a,e], 5 => [f,b], 7 => [c,e], 3 => [d,b]}
# L forks (4)
# {0 => [a,d], 2 => [a,f], 8 => [c,f], 6 => [d,c]}
# + fork (1)
# {4 => [b,e]}
# 7 forks (8)
# {0 => [[d,g], [a,g]], 2 => [[a,h], [f,h]], 8 => [[f,g], [c,g]], 6 => [[c,h], [d,h]]}
