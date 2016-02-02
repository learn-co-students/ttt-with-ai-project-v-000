require 'pry'

class Player
  attr_reader :token

  #initializes new player, cannot write to token after initialized.
  def initialize(token)
    @token = token
  end
end
