class Player::Human < Player

  def move(board)
    puts "#{token}'s turn. Please enter 1-9:"
    gets.strip
  end

end