class Player
  attr_reader :token
  def initialize(token)
    # accepts a token to assign
    if token.upcase == "X"
      @token = "X"
    elsif token.upcase == "O"
      @token = "O"
    end
  end

end
