class Player::Human < Player

  def move(board)
    puts "Where would you like to move, enter 1-9:"
    answer = gets.strip
  end
end