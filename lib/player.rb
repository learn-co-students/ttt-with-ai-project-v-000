class Player
  attr_reader :token, :opp_token
  
  def initialize(token)
    @token = token
    @opp_token = calc_opp_token
  end
  
  def calc_opp_token
    @token == "X" ? "O" : "X"
  end
  
end