class Player
  #inheritance point for other player classes:
  #  - Human < Player
  #  - Computer < Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  #def move
    #represents how player makes move
  #end

end
