class Player
  include Players::Human
  attr_reader :token
  
  def initialize(token)
    @token = token
  end
end