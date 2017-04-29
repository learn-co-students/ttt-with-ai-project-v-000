
class Player

  attr_reader :token

  def initialize(token)
    @token = token if token == "X" || token == "O"
  end


end
