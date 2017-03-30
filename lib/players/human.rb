module Players
  class Human < Player

    def move(board=nil)
      @board = board if board
      puts "Where would you like to move? Please enter 1-9:"
      location = gets.strip
    end

  end
end
