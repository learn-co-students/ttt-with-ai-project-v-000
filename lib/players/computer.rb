require 'pry'

module Players
  class Computer < Player
    def move(board)
      computer_input = rand(1..9).to_s
        #binding.pry
      #computer_input = 2 (index position 1)
      if !board.valid_move?(computer_input)
        move(board)
      else
        computer_input
      end
    end
  end
end
