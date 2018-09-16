require_relative '../player.rb'
require_relative '../game.rb'
# require 'spec_helper'


module Players

  class Human < Player

    def initialize(token)
      @token = token
    end

    def move(board = [])
      puts "Please enter 1-9:"
      gets.strip
    end

  end

end
