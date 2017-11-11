class Players
  class Computer < Player

    def move(board)
      board.display
      puts "\nTicTacToeBot is making a move"
      rand(1..9).to_s
    end

  end
end
