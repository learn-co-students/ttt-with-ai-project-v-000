module Players
  class Human < Player
    def move(board)
      puts "Please enter a valid position:"
      gets.strip
    end
  end
end
