module Players

  class Human < Player

    def move(board)

      input = gets.chomp
      if !board.valid_move?(input)
        input = "invalid"
      end

      input
    end

  end

end
