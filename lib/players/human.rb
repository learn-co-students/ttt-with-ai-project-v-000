module Players
  class Human < Player
    def move(board)
      puts "Where would you like to move?"
      index = gets.strip
      index
    end
  end
end
