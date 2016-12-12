class Player::Human < Player

  def move(board)
    puts "Please enter 1 through 9."
    puts "\n"
    input = gets.strip
  end

end