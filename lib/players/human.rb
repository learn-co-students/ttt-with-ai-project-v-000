class Player::Human < Player
  def move(board)
    puts "Where would you like to move?"
    input = gets.chomp
    #binding.pry
    input
  end
end
