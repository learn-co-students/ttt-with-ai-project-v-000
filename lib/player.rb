class Player
  attr_reader :token
  attr_accessor :parity

  def initialize(token)
    @token = token
  end
end