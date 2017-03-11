module Players
  class Computer < Player

    @@moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    def move(board)
      @@moves.detect {|move| board.valid_move?(move) == true}
    end


  end
end
