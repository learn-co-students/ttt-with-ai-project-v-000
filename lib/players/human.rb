module Players
  class Human < Player

    def move(board)
      puts board
      input = gets.strip
      return input
    end

  end
end
