module Players

  class Human < Player

    def move(board)
      puts "Where would you like to move to? (1-9)"
      board = gets.strip
    end

  end

end