module Players
#==============================================
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def turn
    move = current_player.move(board)
    sleep(0.3)
    board.valid_move?(move)? board.update(move, current_player) : current_player.class == Players::Computer ? turn : move_error!
    board.display
    puts "==========="
  end

  def move_error!
    puts "\n Invalid Move Try Again \n".colorize(color: :white, background: :red)
    sleep(0.2)
    turn
  end

  def winner
    win_combo_char unless !won?
  end
#==============================================
end
