class Player

attr_reader :token

def initialize(token)
  if token == "X" || token == "O"
    @token = token
  end
end




end
