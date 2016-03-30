class Player

  attr_reader :token

  def initialize(token = "X")
    @token = token
  end

end

class Human < Player
  def move(input)
    input = gets.strip
  end
end
