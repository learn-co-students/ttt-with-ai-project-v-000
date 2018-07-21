class Player
  #not actually a valid player of Tic-tac-toe but rather a root class that will act as an inheritance point for
  #actual player classes such as Human < Player and Computer < Player.
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(board)
    #method that represents how that type of player makes a move in Tic-tac-toe.
    input = gets.strip
    input
  end







end
