class Player::Human < Player
  def move(board = nil, position = nil) #can chain this position.gets.strip.to_i
    position = gets.strip
    position
  end

end