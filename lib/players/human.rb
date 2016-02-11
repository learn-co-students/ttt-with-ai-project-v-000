class Player::Human < Player

  def move(board)
    puts "Please choose a move, 1 - 9."
    move = gets.chomp
  end

end