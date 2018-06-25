class Player

attr_reader :token

  def initialize(token)
    @token = token
    token = "X" || "O"

  end


end
