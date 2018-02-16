module Players

  class Computer < Player
    def move(board)
      if !board.taken?("5")
        input = "5"
      elsif !board.taken?("1")
        input = "1"
      elsif !board.taken?("3")
        input = "3"
      elsif !board.taken?("7")
        input = "7"
      elsif !board.taken?("4")
        input = "4"
      elsif !board.taken?("6")
        input = "6"
      elsif !board.taken?("2")
        input = "2"
      elsif !board.taken?("8")
        input = "8"
      else input = "9"
      end
    end
  end
  
end