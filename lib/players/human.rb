module Players

  class Human < Player
    attr_accessor :game

    def game
      @game
    end

    def move(board)
      gets.chomp
    end

  end

end
