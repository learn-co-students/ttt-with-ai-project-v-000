module Players

  attr_accessor :board
  class Computer < Player
    def move(board)
      @board = board
      move = nil
      self.board = board
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    end
  end
end
