class Player
  attr_reader :token 
  
  def initialize(token)
    @token = token
    @opponent_token = "O" if @token == "X"
    @opponent_token = "X" if @token == "O"
  end 
   
end 