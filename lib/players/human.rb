class Player::Human < Player

  def move(board)
    puts "Player '#{token}', please enter 1-9"
    input = gets.strip
  end

end
