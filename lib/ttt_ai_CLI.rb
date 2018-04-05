require 'pry'

class TicTacToe_CLI

  ## Initializes with a logo and the
  def initialize
    print_logo
    start_menu
  end # initialize


  def print_logo
    puts "   ____________     ____________     ____________   "
    puts "  |____    ____|   |____    ____|   |____    ____|  "
    puts "       |  |             |  |             |  |       "
    puts "       |  |             |  |             |  |       "
    puts "       |  |             |  |             |  |       "
    puts "       |  |             |  |             |  |       "
    puts "       |__|      o      |__|       o     |__|       "
  end # intro_logo


  ## presents the start_menu with options for 0 player mode, 1 player mode, and 2 player mode.
  ## exits wi 'exit'
  ## loops until a valid entry is entered
  ## runs play_again? after each game
  def start_menu

    puts "                                                    "
    puts "               WELCOME TO TIC-TAC-TOE!              "

    puts "Choose how many players will be playing the game (0, 1, or 2):"
    puts "Type 'exit' to EXIT"

    user_input = gets.strip.downcase

    case user_input
    when '0'
      zero_players
      play_again?
    when '1'
      one_player
      play_again?
    when '2'
      two_players
      play_again?
    when 'exit'
      abort("You Exited the Game")
    else
      puts "Invalid entry. The choices are 0, 1, 2, or exit!"
      start_menu
    end # case start_menu
  end # start_menu

  ## asks the human player if he/she wants to play again
  def play_again?

    play_again = ''
    puts ""
    puts "Would you like to play again."
    puts "Type 'y' or 'yes' to play again."
    puts "OR"
    puts "Type 'n' or 'no' to exit"
    play_again = gets.strip.downcase

    case play_again
    when 'y', 'yes'
      start_menu
    when 'n', 'no'
      abort("You Exited the Game")
    else
      puts "Invalid choice!"
      play_again?
    end # case play_again

  end # play_again method


  ## asks the human player if he/she wants to go_first
  def go_first?

    puts "Do you want to go first and be X?"
    puts "Type 'y' or 'yes' for YES"
    puts "Type 'n' or 'no' for NO"
    input = gets.strip.downcase

    case input
    when 'y', 'yes'
      true
    when 'n', 'no'
      false
    else
      go_first?
    end

  end # go_first


  ## The computer plays itself
  def zero_players
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))

    puts "To have the computer play itself 100 times, type 'wargames'."
    puts "Type anything else to have it play itself only once"
    user_input = gets.strip

    if user_input.downcase == "wargames"
      100.times{game.play}
    else
      until game.over?
        game.play
      end # until over?
    end # if wargames
  end # zero_players


  ## The human player's opponent is a computer
  def one_player

    if go_first? == true
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
      game.play

    else
      game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
      game.play
    end # inner if
  end # one_player


  ## Two human players play against one another
  def two_players

    if go_first? == true
      game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
      game.play

    else
      game = Game.new(Players::Human.new("O"), Players::Human.new("X"))
      game.play
    end # inner if
  end # two_players

end # class TicTacToe_CLI
