class Player
  attr_reader :token, :index, :how_smart

  def initialize(token,how_smart = "u")
    @token = token
    @how_smart = how_smart
  end

end
