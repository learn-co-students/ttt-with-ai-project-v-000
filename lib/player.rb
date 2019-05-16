require 'pry'

class Player
  attr_accessor :cells, :board, :game
  attr_reader :token

  def initialize(token)
    @token = token
    
  end
end
