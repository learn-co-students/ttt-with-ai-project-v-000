class Player::Human < Player
  
  def move(board)
    puts "Please enter a move (1-9)"
    input = gets.strip
  end
  
end