module Players
  class Human < Player
    def move(board)
      puts "Please enter a number within the range 1-9 to indicate where you would like to move."
      gets.strip
    end
  end
end
