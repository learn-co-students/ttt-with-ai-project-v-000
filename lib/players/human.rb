class Player::Human < Player

  def move
    puts "Please input 1-9."
    gets.strip
  end
end
