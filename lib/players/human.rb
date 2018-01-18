class Player::Human < Player
  
  def move(board)
    puts "\nPlease enter a move (1-9)"
    input = gets.strip
  end
  
end