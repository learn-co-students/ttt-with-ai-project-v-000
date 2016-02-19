class Player::Human < Player
  def move(board)
    puts "Please enter your move position:"
    input = gets.strip
  end
end