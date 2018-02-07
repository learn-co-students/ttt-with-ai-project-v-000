class Player
  #attr_accessor :player_1, :player_2
  attr_reader :token 
  
  def initialize(token)
    @token = token
  end
  
  #def player_1
   # @player_1 = Player.new("X")
  #end
  
  #def player_2
   # @player_2 = Player.new("O")
  #end
  
end