class Player
  attr_reader :token, :name
  @@all = []

  def initialize(token)
    @token = token
    @@all << self
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end
end
