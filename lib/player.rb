class Player
  include Players

  attr_reader :token

  def initialize(token)
    @token = token
  end
end
