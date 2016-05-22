class Player::Human < Player

  def move(board)
    puts "What is your move?"
    position=gets.strip
  end
end