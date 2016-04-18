class Player::Human < Player

  def move(location)
    puts "Please enter a number between 1-9 to move"
    input = gets.strip
    input
  end

end