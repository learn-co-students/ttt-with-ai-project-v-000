module Players
   class Computer < Player
    def move(board)
      cp_input = " "
      if board.taken?("5") == false
        cp_input = "5"
      elsif board.taken?((2 * rand(5)+1).to_s) == false
        cp_input = (2 * rand(5)+1).to_s
      else
        cp_input = (2 * rand(5)).to_s
      end
      cp_input
    end
  end
end
