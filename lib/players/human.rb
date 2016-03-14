class Player::Human < Player

  def move(board)
    puts "Please make your move:"
    gets.strip
  end
end
