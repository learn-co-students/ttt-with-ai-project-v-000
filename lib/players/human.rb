class Player::Human < Player

  def move(board)
   puts "\nPlease enter a number between 1-9:"
   user_input = gets.strip
   user_input
  end

end
