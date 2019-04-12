class Player
  attr_reader :token
  include::Players::Human
  
  def initialize(token)
    @token = token
  end
  

end