class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  class Players
    class Human < Player
    end

  end

end
