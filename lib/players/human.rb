module Players
  class Human < Player

    def initialize(position)
      @token = position
    end

    def move(board)

      puts "What position would you like to make?"
      position = gets

      #board.cells[position.to_i - 1] = @token

      position

    end

  end



end
