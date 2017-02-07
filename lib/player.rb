class Player
  attr_reader :token

  def initialize(token = "X" || token = "O")
    @token = token
  end

end
