class Player::Human < Player
  def move(board)
    puts "It is now #{token}'s turn. Please enter 1-9:"
    gets.chomp
  end
end
