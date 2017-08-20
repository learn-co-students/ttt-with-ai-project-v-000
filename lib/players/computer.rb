module Players
  # attr_accessor :board
  class Computer < Player
    def move(board)
      # @board = board
      move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].select {|position| board.valid_move?(position)}.sample

    end
  end
end