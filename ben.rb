require './lib/game.rb'
require './lib/board.rb'

game=Game.new(Players::Human.new("X"),Players::Computer.new("O"),Board.new)
x=game.player_1
o=game.player_2
