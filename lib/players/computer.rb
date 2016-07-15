require_relative '../player.rb'
require_relative './human.rb'
# require './../../spec/spec_helper.rb'

class Computer < Player
  include Players

  def initialize(token)
    @computer = Players::Computer.new(token)
  end

  def move(board)
    attempt = rand(1..9).to_s
    puts attempt
    if self.board.valid_move?(attempt)
      attempt
    else
      move(board)
    end
  end
end
