class Player::Human < Player

  def move(board)
    puts "Player #{self.token}, please make your move by choosing a number between 1-9."
    player_move = gets.strip
    player_move
  end
end
