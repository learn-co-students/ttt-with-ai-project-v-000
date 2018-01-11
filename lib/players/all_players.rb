module Players
#==============================================
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def winner
    win_combo_char unless !won?
  end
  
  def turn
    move = current_player.move(board)
    sleep(0.3)
    if board.valid_move?(move)
      board.update(move, current_player)
    elsif current_player.class == Players::Computer || current_player.class == Players::Joshua
      turn
    else move_error! end
    board.display
    puts "="*11
  end

  def move_error!
    puts "\n Invalid Move Try Again \n".colorize(color: :white, background: :red)
    sleep(0.2)
    turn
  end
#==============================================
end
