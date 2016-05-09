class Player::Human < Player
  def move(board)
    puts "Please select a position"
    user_input = gets.strip
    user_input
  end
end
