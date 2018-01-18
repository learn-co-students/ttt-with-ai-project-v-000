module Players
  class Human < Player
    def move(board)
      puts "What's your next move?"
      input = gets.strip
    end
  end
end
