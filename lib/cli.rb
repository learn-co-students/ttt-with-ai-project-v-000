# class TicTacToe::CLI
#   attr_reader :player_mode, :input
#
#   def call
#     greeting
#     menu
#   end
#
#   def greeting
#     puts "Hello! Welcome to Tic Tac Toe!"
#     puts "Please, input player mode: 0, 1, or 2"
#     @player_mode = gets.strip.to_i
#     puts "Would you like to go first and be 'X'? (y/n)"
#     @input = gets.strip.downcase
#   end
#
#   def menu
#     if player_mode == 2 && input == "yes" || input == "y"
#       Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
#     elsif player_mode == 2 && input == "no" || input == "n"
#       Game.new(Players::Human.new("O"), Players::Human.new("X"), Board.new).play
#     elsif player_mode == 1 && input == "yes" || input == "y"
#       Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
#     elsif player_mode == 1 && input == "no" || input == "n"
#       Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
#     elsif player_mode == 0
#       puts "Goodbye!"
#       exit
#     end
#   end
# end
