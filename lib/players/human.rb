class Player::Human < Player

  def move(player)
    puts "Input an integer from 1 to 9 to select the location of your next move."
    gets.strip
  end



end
