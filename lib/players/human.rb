module Players
  class Human < Player

    def move(board = Board.new)
      puts "Enter a number between 1 - 9:"
      input = gets.strip
      input
    end
  end
end
