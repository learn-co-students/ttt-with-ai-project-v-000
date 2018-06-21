class Player

  attr_reader :token, :op_token

  def initialize(token)
    @token = token
    if token =="X"
      @op_token ="O"
    else
      @op_token="X"
    end
  end



end
