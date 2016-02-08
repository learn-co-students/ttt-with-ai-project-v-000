class Player
  attr_reader :token
  # , :board, :game
  def initialize(token)
    # that they have a token property that can be set upon initialization.
    @token = token
  end

end