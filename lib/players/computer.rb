require 'pry'
module Players
  class Computer < Player
    def move(board)
      user_input = gets.chomp
      board.cells
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    end

  end

end
