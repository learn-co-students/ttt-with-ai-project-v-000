module Players
  class Computer < Player
    def move (board)
      if board.valid_move?("5")
        return "5"
      elsif board.valid_move?("1")
        return "1"
      elsif board.valid_move?("3")
        return "3"
      elsif board.valid_move?("7")
        return "7"
      elsif board.valid_move?("9")
        return "9"
      elsif board.valid_move?("2")
        return "2"
      elsif board.valid_move?("4")
        return "4"
      elsif board.valid_move?("6")
        return "6"
      elsif board.valid_move?("8")
        return "8"
      end
    end
  end
end
