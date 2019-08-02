#act as an inheritance point for actual player classes such as Human < Player and Computer < Player.
#The Player root class will define only the most basic properties of a player, that they have a token
# property that can be set upon initialization.
class Player
  #Every player subclass will implement a #move method that represents how that type of player makes
  # a move in Tic-tac-toe.
  attr_reader :token

  def initialize(token)
    @token = token
  end

end
