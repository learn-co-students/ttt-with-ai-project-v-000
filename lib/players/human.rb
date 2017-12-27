class Player::Human < Player
  

  def move(board)
    puts "Select a space (1-9):"
    gets.chomp

  end

end