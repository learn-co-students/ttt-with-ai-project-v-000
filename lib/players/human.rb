module Players
  class Human < Player

    def move(board)
      "Please enter 1-9: "
      user_input = gets.strip
      user_input
    end
  end
end
