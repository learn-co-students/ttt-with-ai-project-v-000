class Player::Human < Player

  def move(user_input)
    puts "Please enter 1-9:"
    user_input = gets.strip
    user_input
  end

end