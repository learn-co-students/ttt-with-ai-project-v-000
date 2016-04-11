class Player
  attr_reader :token
  def initialize(token)
    @token= token
  end

  class Human < Player
    def move(argument)
      input = gets.strip
      input
    end
  end
end
