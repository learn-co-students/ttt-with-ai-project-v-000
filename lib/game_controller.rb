require 'pry'

class GameController
  def initialize
    puts "Testing"

    #start_game_human_to_computer
    start_game_human_to_human
    #wargames
  end
  # #start_game_human_to_human - A 2-player game has two human players.
  def start_game_human_to_human(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),board = Board.new)
    game = Game.new(player_1, player_2, board)
    game.play
  end

  # #start_game_human_to_computer - A 1-player game has a human playing against a computer.
  def start_game_human_to_computer(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"),board = Board.new)
    game = Game.new(player_1, player_2, board)
    game.play
  end

  # #wargames - A 0-player game has two computer players
  # playing against each other with no interaction from the user.
  def wargames(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"),board = Board.new)
    game = Game.new(player_1, player_2, board)
    game.play
  end
end


  # def start
  #   puts "Welcome to TicTacToe CLI!"
  #   puts "Player 1 is X "
  #   puts "Please enter 1-9:"
  #
  #
  #   call
  #
  #   # puts "Play Again? y/n"
  # end

  # def call
  #   number = ""
  #   # player_one = Players::Computer.new("X")
  #   # player_two = Players::Computer.new("O")
  #   # game = Game.new(player_one, player_two)
  #   # game = Game.new#(player_one)
  #   # game.start
  #
  #
  #     while number != "exit"
  #     puts "Which game do you want to play?"
  #     puts "Please type one of the following:"
  #     puts " '0' - AI! vs AI! "
  #     puts " '1' - Human vs AI "
  #     puts " '2' - Human vs Human "
  #     puts "To quit, type 'exit'."
  #
  #     number = gets.chomp
  #     case number
  #     when 0
  #       zero
  #     when 1
  #       one
  #     when 2
  #       two
  #     else
  #       # puts ""
  #       # puts ""
  #       # puts "I have no idea what to do with that...👋 !!!"
  #       # puts "Please try again!"
  #       # puts ""
  #       # puts ""
  #     end
  #   end
  # end


  # def zero
  #   #puts "0"
  #   player_one = Players::Computer.new("X")
  #   player_two = Players::Computer.new("O")
  #   game = Game.new(player_one, player_two)
  #   game.play
  # end

  # def one
  #   #puts "1"
  #   # player_one = Players::Human.new("X")
  #   # player_two = Players::Computer.new("O")
  #   # puts "Pick what you want to be?"
  #   # puts "press x or y"
  #   # # get_input = gets.chomp
  #   # game = Game.new(player_one, player_two)
  #   game.play
  # end

  # def two
  #   #puts "2"
  #   player_one = Players::Human.new("X")
  #   player_two = Players::Human.new("O")
  #   puts "Player 1 pick 'X' or 'Y'?"
  #   puts "Player 1 you picked __ "
  #   puts "Player 2 you are __ "
  #   game = Game.new(player_one, player_two)
  #   game.start
  # end
