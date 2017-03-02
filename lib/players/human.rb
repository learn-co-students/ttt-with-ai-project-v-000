class Player::Human < Player
  def move(board)
    puts "What's your move? Select a position on the board (1-9)..."
    position = gets.strip
  end

end
