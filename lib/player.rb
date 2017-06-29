class Player
  
  attr_accessor :name
  attr_reader :token

  def initialize(token)
    @token = token
  end

end
