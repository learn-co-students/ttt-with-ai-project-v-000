class Player
#The `Player` class is not actually a valid player of Tic Tac Toe but rather a root class that will act as an inheritance point for actual player classes such as `Human < Player` and `Computer < Player`. The `Player` root class will define only the most basic properties of a player, that they have a `token` property that can be set upon initialization.
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move
    #Every player subclass will implement a `#move` method that represents how that type of player makes a move in Tic Tac Toe.
  end

end
