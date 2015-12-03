class Player
# root class for Player::HUMAN and Player::COMPUTER
# by using attr_reader instead of attr_accessor, token cannot be changed
  attr_reader :token
  
  def initialize(token)
    @token = token
  end


end

