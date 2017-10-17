
class Player
  attr_reader :token

  def switch(token)
    token == 'X' ? 'O' : 'X'
  end

  def initialize(token)
    @token = token
    @opponent = switch(token)
  end
end