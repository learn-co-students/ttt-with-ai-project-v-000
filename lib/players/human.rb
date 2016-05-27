class Player::Human < Player

attr_accessor :input

  def move(player)
    input = gets.strip
  end



end