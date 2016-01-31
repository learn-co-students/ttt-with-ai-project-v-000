class Player
  attr_reader :token, :opponent_token

  def initialize(token)
    @token = token
    @opponent_token = get_opponent_token
  end

  def get_opponent_token
    if @token == "X"
      return "O"
    else
      return "X"
    end
  end
end