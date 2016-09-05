class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  #The separate #move methods will be defined in the human and computer types of players
  #def move
    #Every player subclass will implement a `#move` method that represents how that type of player makes a move in Tic Tac Toe.
  #end

end
