 
 class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end
  
   def current_player(board)
    if turn_count(board)%2 ==1  
      token = "X"
   else
      token = "O"
  end
    return current_player
  end
end