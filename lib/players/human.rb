module Players

  class Human < Player

    def move(board)
      puts "Player #{self.token}, enter your next move (1-9):"
      move = gets
    end

  end

end
