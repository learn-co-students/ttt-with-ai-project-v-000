class Computer < Player

  def move(board)
    puts "Com #{token} is thinking..."
    @board = board
    possible_moves.sample
  end

  def possible_moves
    (1..9).select {|i| !@board.taken?(i) }
  end
end
