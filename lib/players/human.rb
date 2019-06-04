module Players
  class Human < Player
    def move(board)
      puts "Enter your move:"
      input = gets.strip
    end
  end
end
