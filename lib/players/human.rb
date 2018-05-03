module Players

  class Human < Player

    def move(board)
      input=gets.chomp
      input if board.valid_move?(input)
    end

  end
end
