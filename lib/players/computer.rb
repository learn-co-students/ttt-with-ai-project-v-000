class Computer < Player
  def move(board)
    @board = board
    if self.token == 'X'
      @board.moves.max {|a,b| a.rank <=> b.rank }
    else
      @board.moves.min {|a,b| a.rank <=> b.rank }
    end
  end
end
