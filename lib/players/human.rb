module Players
  class Human < Player

    # def board
    #   self.game.board
    # end

    def move(board)
      puts "Where would you like to go? (1-9)"
      input = gets.strip
    end

  end


end
