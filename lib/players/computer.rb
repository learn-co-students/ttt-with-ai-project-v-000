require_relative "../player.rb"
module Players
  class Computer < Player

    def move(board)
      @board = board
      move = rand(1..9).to_s

    end
  end

end
