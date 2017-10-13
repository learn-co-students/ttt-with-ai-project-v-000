class Player
  attr_reader :token

  def initialize(token = "X" || "O")
    @token = token
end
end
