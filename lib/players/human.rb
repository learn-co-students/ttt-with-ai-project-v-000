class Player::Human < Player
  def move(board)
    puts "Please select a position"
    blue = gets.strip
    blue
  end
end
