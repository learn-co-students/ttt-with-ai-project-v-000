class Player::Human < Player

  def move(board)
    puts "Please enter 1 - 9 to make a move"
    gets.strip
  end
end
