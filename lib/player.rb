require_relative 'game.rb'
require_relative 'board.rb'

class Player
  attr_reader :token
  
  def initialize(token= "X")
    @token = token
  end

end