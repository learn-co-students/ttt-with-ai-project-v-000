module Players

  class Human < Player

    def move(board)
      puts "Enter your next move (1-9):"
      move = gets
    end

  end

end
