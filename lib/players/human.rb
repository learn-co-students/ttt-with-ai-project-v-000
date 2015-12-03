class Player::Human < Player

  def move(board)
    puts "Please select a move between 1 and 9"
    gets.strip
  end

end