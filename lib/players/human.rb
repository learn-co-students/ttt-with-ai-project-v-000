class Player::Human < Player

  def move(board)
    puts "Please enter a number from 1-9:"
    gets.chomp
  end

end