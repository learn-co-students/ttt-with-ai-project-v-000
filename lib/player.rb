class Player
  
  attr_accessor :player_number
  attr_reader :token

  def initialize(token)
    @token = token
  end

end
