##
# => Parent class for the computer and player models
##
class Player
  # => Creates getters and setters
  attr_reader :token

  # => Instantiates a new player with a given token
  def initialize(token)
    @token = token;
  end
end
