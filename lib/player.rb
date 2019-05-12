#not actually a valid player of Tic-tac-toe but rather a root class that will act as an inheritance point for actual player classes such as Human < Player and Computer < Player

#defines only the most basic properties of a player

class Player
  attr_reader :token
  
  def initialize(token)
    @token = token
  end

end