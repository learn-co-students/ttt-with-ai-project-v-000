class Player::Human < Player

  def move(board)
    puts "Please choose a move, 1 - 9."
    puts "The cell numbers go top to bottom, left to right."
    move = gets.chomp
  end

end