module Players

  class Computer < Player

    def move(board)
      board.display
      #return valid move in string
      move = "1"
      count = 1
      9.times do
        if(!board.valid_move?(move))
          count = count + 1
          move = count.to_s
        end
      end
      return move
    end

  end

end
