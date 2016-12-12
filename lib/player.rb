class Player
  attr_reader :token, :opponents_token
  def initialize(token)
    @token = token
    @opponents_token = "O" if @token == "X"
    @opponents_token = "X" if @token == "O"
  end
end
