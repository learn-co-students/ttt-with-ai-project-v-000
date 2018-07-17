module Players
  class Computer < Player

    def move(board)
      array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        #binding.pry
      if board.turn_count == 1
        choice = 4
      elsif board.valid_move?(choice = rand(1...9))
        choice
      else
        array = array - choice 
        move 
      end 
      "#{choice}" 
    end

  end
end

