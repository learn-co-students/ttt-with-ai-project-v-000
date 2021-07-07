module Players

  class Human < Player
    def move(board)
      puts "give me a move (board position 1-9)"
      position = gets.strip
      board.valid_move?(position) ? board.update(position, self) : move(board)
      position
    end
  end

  class Computer < Player

    def move(board, position = "1")
      board.valid_move?(position) ? board.update(position, self) : move(board, (position.to_i + 1).to_s)
      position
    end
  end

end
