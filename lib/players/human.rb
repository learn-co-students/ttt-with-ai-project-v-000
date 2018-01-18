class Player::Human < Player
  
  def move(board)
  	puts "Make your move: choose a cell (1-9)"
  	input = gets.strip
  end
end
