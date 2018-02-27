module Players
  class Computer < Player
  
    def move(board)
      computer_move = nil
      
      
      if !board.taken?(5)
        computer_move = "5"
      elsif !board.taken?(7)
        computer_move = "7"
      elsif !board.taken?(1)
        computer_move = "1"
      elsif !board.taken?(9)
        computer_move = "9"
      elsif !board.taken?(4)
        computer_move = "4"
      elsif !board.taken?(8)
        computer_move = "8"
      elsif !board.taken?(3)
        computer_move = "3"
      elsif !board.taken?(6)
        computer_move = "6"
      else
        computer_move = "2"
      end
      sleep(1)
      computer_move
    end
  
  end
end