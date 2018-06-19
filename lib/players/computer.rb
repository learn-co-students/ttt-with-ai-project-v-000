require 'pry'

module Players

  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2], # top row
      [3,4,5], # middle row
      [6,7,8], # bottom row
      [0,3,6], # left column
      [1,4,7], # middle column
      [2,5,8], # right column
      [0,4,8], # left diagonal
      [6,4,2] # right diagonal
    ]

    def move(board)
      # Need to figure out how to have the computer keep playing until the game ends.
      # Should first look to see if there any of the winning combinations can be completed on the next move. If so, should move to that spot, regardless of token.
      WIN_COMBINATIONS.detect do |combo|
        if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] != " "
          board.cells[combo[2]]
        elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
          board.cells[combo[1]]
        elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[1]] != " "
          board.cells[combo[0]]
          # Why doesn't this work with: self.board.taken?(board.cells[combo[0]]) instead of self.board.cells[combo[0]] != " "? Something is wrong with #taken?
        end
      end


      if !board.taken?("5")
        "5"
      elsif !board.taken?("1")
        "1"
      elsif !board.taken?("3")
        "3"
      # elsif !board.taken?("7")
      #   "7"
      # elsif !board.taken?("9")
      #   "9"
      elsif !board.full?
        board.cells.detect do |cell|
          if cell == " "
            cell
          end
        end
      end
      # If the board isn't full take the first available spot
      # elsif !board.taken?(cell)
      #   board.cells.detect do |cell|
      #     cell == " "
      #     cell
      #   end
      # end
    end
  end

end
