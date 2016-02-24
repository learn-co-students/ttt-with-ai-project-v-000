class Player
  attr_reader :token
  def initialize(token)
    @token = token
  end

  def other_token
    if @token == "O"
      "X"
    elsif @token == "X"
      "O"
    end
  end

end