class Player
  attr_reader :token
  private
  attr_writer :token
  public

  def initialize(token)
    self.token = token
  end

end
