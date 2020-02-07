class Player
  attr_reader :token
  attr_accessor :name

  def initialize(token)
    @token = token
    @name = 'Hal 3000'
  end

end
