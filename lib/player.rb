class Player

  attr_reader :token

  def initialize(token)
    @token = token
  end

  def opp_token
    self.token == "X" ? "O" : "X"
  end


end
