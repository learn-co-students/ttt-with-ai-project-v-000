class Player::Human < Player

  def move(input)
    puts "Where would you like to move? Enter 1-9."
    input = gets.strip 
    puts "#{input}"
    input 
  end 

end 