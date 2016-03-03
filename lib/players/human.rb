class Player::Human < Player
  def move(input)
    puts "Please choose 1-9:"
    input = gets.strip
    input
  end

end