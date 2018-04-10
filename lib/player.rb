class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def token
    @token.freeze
  end
end
