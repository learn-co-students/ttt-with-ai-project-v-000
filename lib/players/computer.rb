module Players
    class Computer < Player
      
       def move(board)
    if !board.taken?(5)
      move = "5"
    else
      best_move(board) + 1
    end
  end
  
    end 
  end 