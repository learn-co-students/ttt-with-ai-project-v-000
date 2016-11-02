class Player
  attr_reader :token
  attr_accessor :turn_count

  def initialize(token)
    @token = token
    @turn_count = 0
  end
end
