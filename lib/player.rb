class Player
  attr_reader :token

  def initialize(token)
    @token = token if valid_player?(token)
  end

  def valid_player?(token)
    (token == "X" || token == "O") ? true : false
  end
end
