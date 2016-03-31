class Player
  attr_reader :token, :name

  def initialize(marker, name = nil)
    @token = marker
    @name = name if name
  end
end