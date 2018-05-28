module Players
  class Human < Player

    def move(board)
      puts board
      puts "What is your move?"
      input = gets.strip
      return input
    end

  end
end
