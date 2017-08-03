#inheritance point for Players::human & Players::computer
class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

end
