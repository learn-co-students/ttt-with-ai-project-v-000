class Player::Human < Player

  def move(move)
    move = gets.chomp.upcase
    move
  end
end
