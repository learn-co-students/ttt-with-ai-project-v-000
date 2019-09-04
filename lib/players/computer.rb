require 'pry'

module Players
  class Computer < Player
    def move(board)
      # super
      # returns a valid position for the computer to move
      # Return string position the computer wants to move to
      # The method iterates through the board's array to find the next available move and return the number string
      # once it finds it.
      if self.token == "X"
        if board.cells[0] == " "
          "1"
        elsif board.cells[5] == "O" && board.valid_move?("4")
          "4"
        elsif board.cells[6] == "O" && board.cells[4] == "O" && board.valid_move?("3")
          "3"
        elsif board.cells[4] == "O" && board.cells[1] == "O" && board.valid_move?("8")
          "8"
        elsif board.cells[0] == "X" && board.cells[2] == "X" && board.valid_move?("2")
          "2"
        elsif board.cells[0] == "X" && board.cells[3] == "X" && board.valid_move?("7")
          "7"
        elsif board.cells[4] == " "
          "5"
        elsif board.cells[3] == " "
          "4"
        elsif board.cells[7] == " "
          "8"
        elsif board.cells[5] == " "
          "6"
        elsif board.cells[8] == " "
          "9"
        elsif board.cells[1] == " "
          "2"
        elsif board.cells[2] == " "
          "3"
        elsif board.cells[6] == " "
          "7"
        end # mini if/else
      elsif self.token == "O"
        if board.cells[0] == "X" && board.valid_move?("5")
          "5"
        elsif board.cells[0] == "X" && board.cells[3] == "X" && board.valid_move?("7")
          "7"
        elsif board.cells[6] == "O" && board.cells[5] == "O" && board.valid_move?("3")
          "3"
        elsif board.cells[1] == "O" && board.cells[4] == "O" && board.valid_move?("8")
          "8"
        elsif board.cells[0] == "X" && board.cells[2] == "X" && board.valid_move?("2")
          "2"
        elsif board.cells[6] == " "
          "7"
        elsif board.cells[1] == " "
          "2"
        elsif board.cells[5] == " "
          "6"
        elsif board.cells[8] == " "
          "9"
        elsif board.cells[2] == " "
          "3"
        elsif board.cells[3] == " "
          "4"
        elsif board.cells[7] == " "
          "8"
        elsif board.cells[4] == " "
        end #mini if/else
      end #if/else
    end # move

    # def x_strategy
    #   if board.cells[0] == " "
    #     "1"
    #   elsif board.cells[4] == " "
    #     "5"
    #   elsif board.cells[3] == " "
    #     "4"
    #   elsif board.cells[7] == " "
    #     "8"
    #   elsif board.cells[5] == " "
    #     "6"
    #   elsif board.cells[8] == " "
    #     "9"
    #   end # mini if/else
    # end

    # def o_strategy
    #   if board.cells[0] == "X"
    #     "5"
    #   elsif board.cells[6] == " "
    #     "7"
    #   elsif board.cells[1] == " "
    #     "2"
    #   elsif board.cells[5] == " "
    #     "6"
    #   else
    #     "9"
    #   end #mini if/else
    # end

  end
end


# return_value = board.cells.detect do |position|
#   position_integer = board.cells.index(position) + 1
#   position_string = "#{position_integer}"
#   board.valid_move?(position_string)
#   # binding.pry
# end
# # binding.pry
# position_integer = board.cells.index(return_value) + 1
# "#{position_integer}"
