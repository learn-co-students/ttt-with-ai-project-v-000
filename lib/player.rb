class Player
  attr_reader :token, :name
   
  def initialize (token, name) #initializes with a name and a token
    @token = token
    @name=name
  end
end