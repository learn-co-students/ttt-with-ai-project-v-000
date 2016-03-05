class Player::Human < Player
  def move(board = nil, position = nil)
    position = gets.strip
    position
  end

end