class Player::Human < Player
  def move(board)
    puts "Please select a position"
    gets.strip
  end
end
