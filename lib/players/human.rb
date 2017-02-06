module Players
  class Human < Player

    def move(board)
      "Please enter a number 1-9 to make a move"
      gets.chomp
    end
  end
end
