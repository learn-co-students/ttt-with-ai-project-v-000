class Player::Warshua < Player

  def move(board, game)
    @current_game = game
    current_board = board
    if current_board.turn_count == 0
      valid_moves = board.current_valid_moves.split(", ")
      cpu_move = valid_moves.sample.to_s
      puts "Starting game..."
      puts "JOSHUA randomly chose #{cpu_move}"
      cpu_move
    else
      best_move = get_best_move(current_board, depth = 0, best_score = {})
      puts "JOSHUA chose #{best_move}"
      best_move
    end
  end


  def get_best_move(board, depth = 0, best_score = {})
    return 0 if @current_game.draw?
    return -1 if @current_game.over?

    board.available_spaces.each do |space|
      board.update(space, @current_game.current_player)
      best_score[space] = -1 * get_best_move(board, depth + 1, {})
      board.reset_space_at(space)
    end

    best_move = best_score.max_by { |key, value| value }[0]
    highest_minimax_score = best_score.max_by { |key, value| value }[1]

    if depth == 0
      return best_move
    elsif depth > 0
      return highest_minimax_score
    end
  end
end
