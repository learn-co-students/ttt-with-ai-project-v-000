module Players
  class Human < Player

    def move(board=nil)
      puts "What spot on the board would you like to play?"
      gets.strip
    end
  end
end
