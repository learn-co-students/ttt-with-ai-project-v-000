class Player::Human < Player
  def move(board, timer)
    puts "Please enter 1-9:"
    gets.chomp
  end
end
