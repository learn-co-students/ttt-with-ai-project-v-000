module Players
  class Human < Player

    def move(board)
      @board.display
      puts "Hello Human! Please enter a number between 1-9."
      input = gets.strip
    end
  end
end
