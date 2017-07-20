module Players

  class Computer < Player
    def move(board)
        valid_moves = ["1", "2", "3", "4", "5", "6", "7", " 8", "9"]
        comp_move = valid_moves.sampleto
    end
  end

end

#test
