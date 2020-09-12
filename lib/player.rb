class Player

  attr_reader :token, :name

  def initialize(token, name=nil)
    @token = token
    @name = name
  end

end
