class Player
  attr_reader :token #should only be read

  def initialize(token)
    @token = token
  end
end
