module Players

  class Computer < Player
    def move(board)
      array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      input = array.find {|position| board.valid_move?(position)}
    end
  end

end
