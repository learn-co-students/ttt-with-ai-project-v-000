require 'pry'

class Player
  attr_reader :token

  def initialize(player)
    @token = player
  end
  #instantiates the player class (self) and gives it an "X" or an "O" value and assigns that to token
end
