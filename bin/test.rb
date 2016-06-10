#!/usr/bin/env ruby

require_relative '../config/environment'


# computer = Player::Computer.new("O")
# board = Board.new

# switch = computer.switch_player(computer)
# puts computer.token
# puts switch.token

computer = Player::Computer.new("X")
full_board = Board.new

full_board.cells = ["X", "O", "X", "O", "O", "X", "X", "X", "O"]

one = Board.new
one.cells = ["X", "O", "X", "O", "O", "X", " ", " ", " "]

empty = Board.new

#one.display

# game = Game.new
# game.board = one
# game.board.display

# puts "Winner = #{game.winner}"


puts "#{computer.move(empty)}"

