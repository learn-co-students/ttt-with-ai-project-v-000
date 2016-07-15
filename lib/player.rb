require_relative './game.rb'
require_relative './players/human.rb'
# require 'spec_helper'


class Player

  attr_reader :token

  def initialize(token)
    @token = token
  end

end
