require 'pry'

class Player
  attr_accessor :board

  def initialize(token)
    @token = token
  end

  def token
    @token.dup.freeze
  end

end
