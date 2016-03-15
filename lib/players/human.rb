class Player::Human < Player

  def move(board)
    puts "Player #{token}, please select your next move: (1-9)"
    gets.strip
  end
end
