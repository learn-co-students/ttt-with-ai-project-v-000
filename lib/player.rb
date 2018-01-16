class Player

  attr_reader :token

  def initialize(token)
    @token = token
    @taken = []
  end

end
