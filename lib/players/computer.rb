module Players
  class Computer < Player


    def move(board)
      if !board.taken?("5")
        "5"
      elsif board.taken?("5")
        return "1" || "3" || "7" || "9"

      end
    end

  end
end
