require_relative "../board.rb"
require_relative "../player.rb"

class Players

  class Computer < Player

    def move(board)
      puts ""
      puts ""
      puts "I'm a computer! My move is GENIUS:"
      puts ""
      possible_moves = ["1","2","3","4","5","6","7","8","9"]
      possible_moves.shuffle.detect { |position| board.valid_move?(position) }
    end

  end

end
