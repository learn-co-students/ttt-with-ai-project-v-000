class Player
  attr_reader :token, :name
  @@all = []

  def initialize(token)
    @token = token
  end

  def name=(name)
    @name = name
    @@all << self
  end

  def self.find_by_token(token)
    @@all.detect {|player| player.token == token}
  end
end
