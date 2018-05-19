class Player
  #macro that defines only the getter. Retrieves the value of an instance variable.
  attr_reader :token

  def initialize(token)
    @token = token
  end

end
