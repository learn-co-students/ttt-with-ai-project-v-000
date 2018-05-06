class Player

  attr_reader :token #=> X or O

  def initialize(token)
    @token = token 
  end

  # and that's it. the move stuff happens elsewhere under the subclasses computer and human
end
