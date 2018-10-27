require_relative './players/human.rb'

class Player

  attr_reader :token
  
  def initialize(token)
    @token= token
  end
  
end