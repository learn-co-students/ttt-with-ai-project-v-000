class Player

  attr_reader :token

  def initialize(x_or_o)
    @token = x_or_o.upcase
  end

end