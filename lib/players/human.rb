module Players
  class Human < Player

    def move(board)
      puts "Please enter the number of the space, 1-9:"
      input = gets.strip
    end
  end
end
