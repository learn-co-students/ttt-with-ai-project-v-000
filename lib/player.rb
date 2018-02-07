class Player

  #attr_accessor :player_1, :player_2
  attr_reader :token 
  
  def initialize(token)
    @token = token
    #@player_1 = "X"
    #@player_2 = "O"
  end
  
end