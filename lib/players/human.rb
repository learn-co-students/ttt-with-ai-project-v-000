class Player::Human < Player

  #gets player move, inherits from Player.
  def move(board)
    puts "What's your next move?"
    player_move = gets.chomp
    player_move
  end

end
