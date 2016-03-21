require 'pry'

class Computer < Player

  def move(board)
    # [*1..9].sample.to_s
    @board = board
    if self.token == 'X'
      @board.moves.max {|a,b| a.rank <=> b.rank }
    else
      @board.moves.min {|a,b| a.rank <=> b.rank }
    end
  end
end
