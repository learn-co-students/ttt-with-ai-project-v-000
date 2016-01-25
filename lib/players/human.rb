class Player::Human < Player

  def move(location = "")
    location = gets.chomp
    location
  end

end