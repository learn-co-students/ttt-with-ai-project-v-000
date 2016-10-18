class Player

  attr_accessor :token

  def initialize(token)
    @token = token
    @token.freeze
  end
end
