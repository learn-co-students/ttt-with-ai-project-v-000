class Player #creates a clas for both human and computer to inherit from
  attr_reader :token
  def initialize(token)
    @token = token
  end
end
