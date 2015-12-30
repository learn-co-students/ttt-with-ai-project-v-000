class Player

  attr_reader :token, :o_tok

  def initialize(token)
    @token = token
    @o_tok = "X"
    if @token == "X"
      @o_tok = "O"
    end
  end

end