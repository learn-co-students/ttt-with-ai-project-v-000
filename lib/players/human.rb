module Players

  class Human < Player

    def move(board = nil)
      puts "Please enter a Position"
      puts "(1 | 2 | 3)"
      puts "-----------"
      puts "(4 | 5 | 6)"
      puts "-----------"
      puts "(7 | 8 | 9)"

      input = gets.strip
    end

  end

end
