class Player
  attr_reader :token, :opponent_token

  def initialize(token)
    @token = token
    self.token == "X" ? @opponent_token = "O" : @opponent_token = "X"
  end
end
