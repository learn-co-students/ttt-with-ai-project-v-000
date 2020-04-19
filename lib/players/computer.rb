class Player::Computer < Player

  def move(board, game)

    if board.turn_count == 0
      puts "Starting game..."
    end
    valid_moves = board.current_valid_moves.split(", ")
    cpu_move = valid_moves.sample.to_s
    puts "The computer chose #{cpu_move}"
    cpu_move
  end
end
