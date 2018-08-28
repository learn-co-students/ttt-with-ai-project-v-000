require 'pry'

module Players
  class Computer < Player
    
    def move(board)
      #valid_moves = board.cells.each_with_index.map {|value, index| value.replace(index + 1)}
      
      computer_move = valid_moves.sample
      board.update(computer_move, computer) if valid_move?(computer_move)
      binding.pry
      
      # if valid_moves.include?(computer_move)
      #   true
      # end
      #board.valid_move?(computer_move)
    end
    
  end
end