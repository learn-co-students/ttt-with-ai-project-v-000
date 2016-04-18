class Player
  class Computer < Player
    def move(board)
      if board.turn_count == 0
        "5"
      elsif board.valid_move?("5")
        "5"
      elsif board.valid_move?("1")
        "1"
      end
    end
  end
end
