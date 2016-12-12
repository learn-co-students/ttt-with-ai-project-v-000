class Player::Human < Player
  def move(board)
    puts "Player #{self.token}, please enter your move position:"
    input = gets.strip
  end
end