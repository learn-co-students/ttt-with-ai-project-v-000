module Players
  class Human < Player
    def move(board)
      puts "Please choose a space between 1 and 9:"
      gets.strip
    end
  end
end