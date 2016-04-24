class Player::Joshua < Player

  def move(board)
    valid_moves = board.current_valid_moves.split(", ")
    cpu_move = valid_moves.sample.to_s
    puts "JOSHUA chose #{cpu_move}"
    cpu_move
  end

end
