module Players
  class Human < Player

    def move(cells)
      "To make your move, please enter 1-9"
      input = gets.chomp
    end

  end

end
