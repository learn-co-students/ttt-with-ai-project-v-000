class Player::Human < Player

  def move(board)
    puts "what would you like to do?"
    input = gets.chomp
  end
end