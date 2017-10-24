class Player
  attr_reader :token
  include Players
  def initialize(token)
    @token = token
  end
end
