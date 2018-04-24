module Players
  class Human < Player
    def move (board)
      puts "Please enter where you would like to move (1-9):"
      input = gets.strip
    end
  end
end
