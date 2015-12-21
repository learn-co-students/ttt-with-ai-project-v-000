class Player::Human < Player
  def move(board)
    puts "#{self.token}, please choose a number between 1-9 to make your move."
    player_move = gets.strip
    player_move
  end

end