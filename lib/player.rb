class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(user_input)
    user_input = gets.strip
  end
end
