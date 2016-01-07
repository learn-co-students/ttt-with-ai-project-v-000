
class Player
  attr_reader :token, :wins

  def initialize(token)
    @token = token
    @wins = 0
  end

end