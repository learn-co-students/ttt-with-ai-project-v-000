class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(number)
    number.to_i
  end


end
