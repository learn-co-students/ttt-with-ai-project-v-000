module Players
  class Human < Player

    def move(board)
      point = location.to_i - 1
      return board[point]
    end

    
  end
  

end
