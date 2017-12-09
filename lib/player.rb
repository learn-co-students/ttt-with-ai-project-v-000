require 'pry'

class Player
  attr_accessor :board
  
  def initialize(token)
    @token = token
  end

  def token
    @token
  end

  def token=(token)
    raise NoMethodError
    binding.pry
  end

end
