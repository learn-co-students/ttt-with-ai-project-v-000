require "./lib/player"

class AI < Player
  attr_accessor :token
  attr_accessor :skill, :game, :scenarios

  def initialize(token, game)
    super
    @scenarios = {} #=> will contain scenario { id(n): { position: a, score: 0 }}

  end
end
