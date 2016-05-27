class Player::Human < Player

  def move(player)
    puts "Which location on the board do you want to move to?"
    gets.strip
  end



end
