class Player
  attr_reader :token
  attr_accessor :win_count

  def initialize(token)
    @token = token
    @win_count = 0
  end
end
