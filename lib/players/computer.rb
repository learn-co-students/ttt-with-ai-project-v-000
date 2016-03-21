class Computer < Player
  def move(board)
    puts "#{self.token}, please choose a square to play.\n\n"
    sleep 1

    @board = board
    if self.token == 'X'
      @board.moves.max {|a,b| a.rank <=> b.rank }
    else
      @board.moves.min {|a,b| a.rank <=> b.rank }
    end
  end
end
