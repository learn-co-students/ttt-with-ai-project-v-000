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
      # Computer will first look to see if there any of the winning combinations can be completed on the next move.
      # Didn't attempt to have computer choose to win vs. block. Computer will complete the first winning combination, regardless of token.
      space = ""
      WIN_COMBINATIONS.detect do |combo|
        if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] != " " && board.cells[combo[2]] == " "
           space = (combo[2]+1).to_s
        elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] != " " && board.cells[combo[1]] == " "
          space = (combo[1]+1).to_s
        elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[1]] != " " && board.cells[combo[0]] == " "
          space = (combo[0]+1).to_s
        end
      end


      # WIN_COMBINATIONS.detect do |combo|
      #   if self.token == "X" && board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == " "
      #     space = (combo[2]+1).to_s
      #   elsif self.token == "X" && board.cells[combo[0]] == "O" && board.cells[combo[2]] == "O" && board.cells[combo[1]] == " "
      #     space = (combo[1]+1).to_s
      #   elsif self.token == "X" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O" && board.cells[combo[0]] == " "
      #     space = (combo[0]+1).to_s
      #   elsif self.token == "X" && board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == " "
      #     space = (combo[2]+1).to_s
      #   elsif self.token == "X" && board.cells[combo[0]] == "X" && board.cells[combo[2]] == "X" && board.cells[combo[1]] == " "
      #     space = (combo[1]+1).to_s
      #   elsif self.token == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X" && board.cells[combo[0]] == " "
      #     space = (combo[0]+1).to_s
      #   elsif self.token == "O" && board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == " "
      #     space = (combo[2]+1).to_s
      #   elsif self.token == "O" && board.cells[combo[0]] == "X" && board.cells[combo[2]] == "X" && board.cells[combo[1]] == " "
      #     space = (combo[1]+1).to_s
      #   elsif self.token == "O" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X" && board.cells[combo[0]] == " "
      #     space = (combo[0]+1).to_s
      #   elsif self.token == "O" && board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == " "
      #     space = (combo[2]+1).to_s
      #   elsif self.token == "O" && board.cells[combo[0]] == "O" && board.cells[combo[2]] == "O" && board.cells[combo[1]] == " "
      #     space = (combo[1]+1).to_s
      #   elsif self.token == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O" && board.cells[combo[0]] == " "
      #     space = (combo[0]+1).to_s
      #   end
      # end

      if space == "" && !board.taken?("5")
        space = "5"
      elsif space == "" && !board.taken?("1")
        space = "1"
      elsif space == "" && !board.taken?("3")
        space = "3"
      elsif space == "" && !board.full?
        board.cells.each_with_index do |cell, i|
          if cell == " "
            space = (i+1).to_s
          end
        end
      end
      space
    end

  end

end
