class Player::Computer < Player

  MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  EXPECTED_VALUES = {}

  def move(board)
    valid_moves(board)
      .map{|move| [move, board_updated(board, move, self)]}   
      .map{|move, board| [move, cached_expected_value(board, opponent)]}
      .max_by{|move, expected_value| expected_value}
      .first
  end

  def valid_moves(board)
    MOVES.select do |move|
      !board.taken?(move)
    end
  end

  def board_updated(board, move, player)
    updated = Board.new
    board.cells.each_with_index do |cell, index|
      updated.cells[index] = cell
    end
    updated.update(move, player)
    updated
  end

  def cached_expected_value(board, current_player)
    expected_value = nil
    if EXPECTED_VALUES.has_key?([board.cells, current_player.token, self.token])
      expected_value = EXPECTED_VALUES[[board.cells, current_player.token, self.token]]
    else
      expected_value = expected_value(board, current_player)
      EXPECTED_VALUES[[board.cells, current_player.token, self.token]] = expected_value
    end
    expected_value
  end

  def expected_value(board, current_player)
    if game(board).winner == token
      1
    elsif game(board).won?
      -1
    elsif game(board).draw?
      0
    elsif current_player != self
      valid_moves(board)
        .map{|move| board_updated(board, move, opponent)}   
        .map{|board| cached_expected_value(board, self)}
        .min
    else
      valid_moves(board)
        .map{|move| board_updated(board, move, self)}   
        .map{|board| cached_expected_value(board, opponent)}
        .max
    end
  end

  def opponent
    tokens = ["X", "O"]
    tokens.delete(self.token)
    Player.new(tokens.sample)
  end

  def game(board)
    game = Game.new
    game.board.cells = board.cells
    game
  end

end