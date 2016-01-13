class Player::Human < Player

  def move(board)
    puts "Please enter a number between 1 and 9"
    gets.strip
  end
end