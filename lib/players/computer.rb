module Players
  class Computer < Player
    def move(board)
      @board = board
      valid_moves = []
      (1..9).each {|num| valid_moves << num.to_s unless board.taken?(num)}
      if valid_moves.include?("5")
        "5"
      elsif valid_moves.include?("1")
        "1"
      elsif valid_moves.include?("3")
        "3"
      elsif valid_moves.include?("7")
        "7"
      elsif valid_moves.include?("9")
        "9"
      else
        valid_moves.sample
      end
    end
  end
end
