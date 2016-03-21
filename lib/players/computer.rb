require 'pry'

class Computer < Player

  def move(board)
    # [*1..9].sample.to_s
    @board = board
    @board.moves.max {|a,b| a.rank(self.token) <=> b.rank(self.token) }
  end
end