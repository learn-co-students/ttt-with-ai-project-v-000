module Players
  class Computer < Player
    
    def move(board)
      computer_move = rand(1..9).to_s
      if board.valid_move?(computer_move)
        computer_move
      else 
        move(board)
      end
    end 
  end
end 
