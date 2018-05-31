module Players
  class Human < Player

    def move(board)
      "Please enter 1-9: "
       gets.strip
    end
  end
end
