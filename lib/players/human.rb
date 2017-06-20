module Players
  class Human < Player

    def move(board)
      puts "Please enter a number from 1 to 9:"
      gets.strip
    end
  end
end
