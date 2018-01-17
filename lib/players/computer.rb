module Players

  class Computer < Player

    def move(input)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      valid_moves.shuffle!
      valid_moves.detect{|move| input.valid_move?(move)}
    end
  end
end
