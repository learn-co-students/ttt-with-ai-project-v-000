class Player
  attr_reader :token

  def initialize
    if turn_count % 2 == 0
			return "X"
		else
			return "O"
		end
  end

  def token

  end
end
