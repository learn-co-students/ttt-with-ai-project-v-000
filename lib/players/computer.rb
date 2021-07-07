# Define a class Players::Computer that represents a computer player of Tic-tac-toe.

module Players

  class Computer < Player
    attr_accessor :board

  def move(board)
    @board = board
    input = rand(1..9).to_s
    if @board.valid_move?(input)
      input
    elsif !@board.valid_move?(input)
      move(board)
    else @board.full?
      nil
    end
  end

end
end
