module Players

  class Human < Player

    def move(board = nil)
      puts "Please enter a Position (1 - 9)"

      input = gets.strip
    end

  end

end
