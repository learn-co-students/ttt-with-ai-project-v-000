require 'pry'
class Player

  attr_reader :token #token cannot be changes once assigned in initialize therefore we only need reader method

  def initialize(token)
    @token = token
  end

end
