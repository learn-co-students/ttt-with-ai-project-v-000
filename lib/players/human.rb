class Player::Human < Player

  def move(board)
    puts "Player #{token}: Please make your move:"
    input = gets.chomp
  end
end
