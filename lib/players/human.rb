class Player::Human < Player

  def move(board)
    puts "Please Make Your Move Player #{self.token}: "
    position = gets
  end

end