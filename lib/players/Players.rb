
module Players

  class Human < Player
    def move(board)
      gets.strip
    end
  end

  class Computer < Player

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      corners = ["1", "7", "3", "9"]
      if !board.taken?("5")
        move = "5"
      elsif
        move = corners.select {|corner| !board.taken?(corner)}.sample
      elsif
        move = valid_moves.reject {|move| corners.include?(move)}.sample
      end
      move
    end

  end
end
