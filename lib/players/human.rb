class Player::Human < Player
  def move(board)
    puts "#{self.token}, please enter your move as a number 1-9."
    input = gets.strip
  end
end