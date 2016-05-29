class Player::Computer < Player

  attr_accessor :valid_moves

  def move(board)
    @valid_moves = []
    board.cells.each_with_index do |cell, index|
      @valid_moves << index.to_s if board.valid_move?(index.to_s)
    end
    @valid_moves[0]
  end
end
