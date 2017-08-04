module Players
  class Computer < Player

    def move(board)
      if board.taken?("1") == false
        move = "1"
      elsif board.taken?("2") == false
        move = "2"
      elsif board.taken?("3") == false
        move = "3"
      elsif board.taken?("4") == false
        move = "4"
      elsif board.taken?("5") == false
        move = "5"
      elsif board.taken?("6") == false
        move = "6"
      elsif board.taken?("7") == false
        move = "7"
      elsif board.taken?("8") == false
        move = "8"
      elsif board.taken?("9") == false
        move = "9"
      end
    end

  end
end
