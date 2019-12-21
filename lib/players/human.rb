module Players
  class Human < Player
    def move(board)
      puts "Please enter 1-9 to make your move."
      input = gets.strip
    end
  end
end
