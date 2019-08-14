class Players::Computer < Player
  attr_accessor :opponent, :best_choice, :board

  def opponent_token
    return "O" if self.token == "X"
    return "X"
  end

  def move(board)
    @opponent = Player.new(opponent_token)
    minmax(board, self)
    return "#{@best_choice}"
  end

  def minmax(board, current_player)
    game = Game.new(current_player, @opponent, board) if @token == "X"
    game = Game.new(@opponent,current_player,board) if @token == "O"
    if game.over? || game.won?
      return 1 if game.winner == @token
      return -1 if game.won?
      return 0
    end

    moves = {}

    temp_board = Board.new
    temp_board.cells = board.cells.map { |cell| cell }

    board.available_moves.each { |move|
      temp_board.update(move, current_player)
      board.undo(move)
      moves[move] = minmax(temp_board, switch(current_player))
    }

    @best_choice, best_score = best_move(current_player, moves)
    best_score
  end

  def best_move(player, moves)
    if player.token == self.token
      moves.max_by{ |k,v| v }
    else
      moves.min_by{ |k,v| v }
    end
  end

  def switch(player)
    return @opponent if player == self
    return self
  end
end
