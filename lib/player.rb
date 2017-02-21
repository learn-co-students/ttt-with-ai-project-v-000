class Player
  attr_reader :token

  def initialize (token = "X")
    @token = token
    @opponent = switch(token)
  end

  def switch(token)
    token == 'X' ? 'O' : 'X'
  end
end
