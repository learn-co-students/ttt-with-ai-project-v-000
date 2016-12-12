class Player::Human < Player
  def move(input)
      puts "Please choose 1-9:"
      gets.strip
  end
end
