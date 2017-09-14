class Player #Player root class will define only token property that can be set upon initialization.

  attr_reader :token

  def initialize(token)
    @token = token
  end

end

#Every player subclass will implement a #move method that represents how that type of player makes a move in Tic-tac-toe.
