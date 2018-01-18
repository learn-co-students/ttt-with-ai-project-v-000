class Player::Human < Player

  def move(token)
    puts ""
    puts "Please enter 1-9:"
    gets.strip
  end
end
