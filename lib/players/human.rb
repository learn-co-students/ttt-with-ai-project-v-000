class Player::Human < Player
  def move(input)
    puts "It is now #{token}'s turn. Please enter 1-9:"
    input = gets.chomp
  end
end
