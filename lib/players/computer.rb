class Players
  class Computer < Player

    def move(board)
      board.display
      puts "TicTacToeBot will now make a move"
      rand(1..9).to_s
    end

  end
end
