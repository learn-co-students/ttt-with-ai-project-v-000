class Player

  def initialize(token)
    @token = token
  end

  # This would be the same as:
  # <<attr_reader :token>>
  # which is what's on GitHub
  def token
    @token
  end
end
