class Player::Human < Player

  def move(board)
    puts "Please input 1-9."
    gets.strip
  end
end
