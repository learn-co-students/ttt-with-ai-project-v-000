require 'pry'

module Players
  class Computer < Player
  
    def move(board)
      valid_moves = board.cells.map.with_index(1) {|value, index| value = index.to_s if value == " "}
      computer_move = valid_moves.sample
    end
  end
  
end