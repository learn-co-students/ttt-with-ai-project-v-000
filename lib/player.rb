class Player
  
  attr_reader :token
  
  @@players = []
  
  def initialize(token = "X")
    @token = token
  end
end