class Player::Human < Player

  def move(board)
    puts "Enter a move 1-9:"
    move = gets.chomp
    move
  end

end