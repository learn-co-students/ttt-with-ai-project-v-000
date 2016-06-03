require './config/environment.rb'
require 'pry'
class Player::Computer < Player

  def move(game, board)
    minimax = game.minimax
    position = game.choice.to_s
  end

end