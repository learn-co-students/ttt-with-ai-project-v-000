class Player::Human < Player
  def move(board)
    puts "#{self.token}, choose a number between 1-9 to move."
    input = gets.chomp
    input
  end
end
