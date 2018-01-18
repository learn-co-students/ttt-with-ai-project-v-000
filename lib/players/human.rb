module Players
  class Human < Player

    def move(board)
      "Enter your move 1-9:"
      gets.strip
    end

  end
end