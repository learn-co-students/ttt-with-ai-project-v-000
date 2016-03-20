class Player::Human < Player

  def move(board)
  	puts "Enter a valid move from 1-9:"
    gets.strip
  end
end