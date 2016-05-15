class Player::Human < Player
  def move(board)
    puts "Please enter your move."
    gets.strip
  end

end
