class Player

  attr_reader :token

  def initialize(token)
    @token = token
    @spots = []
    @opp_spots = []

  end

end
