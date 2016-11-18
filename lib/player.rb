class Player
  attr_reader :token, :name

  def initialize(token, name = Bobo)
    @token = token
    @name = name
  end

end
