class Player::Human < Player

  def move(board)
    puts "Please enter a number 1-9."
    input = gets.chomp
  end

end
