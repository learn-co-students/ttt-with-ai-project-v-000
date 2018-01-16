class Player

  attr_reader :token

  def initialize(token)
    @token = token
    @opp_taken = []
  end

end
