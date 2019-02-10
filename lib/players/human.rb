class Player::Human < Player

  def move(location)
    puts "Please enter a number between 1-9 to move"
    move = gets.strip
    move
  end

end