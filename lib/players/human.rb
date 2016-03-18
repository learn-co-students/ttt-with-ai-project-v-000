class Player::Human < Player

  def move(board)
    "Type a number to make a move."
    input = gets.strip
  end
end