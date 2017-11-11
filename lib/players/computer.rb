class Players
  class Computer < Player

    def move(board)
      puts board.display
      puts "\nTicTacToeBot is making a move"
      move = 0
      until board.valid_move?(move)
        move = rand(1..9).to_s
      end
      move.to_s
    end

  end
end
