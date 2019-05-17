module Players
  class Human < Player
    def move(board)
      puts "Make a move:"
      gets.strip
    end
  end
end
