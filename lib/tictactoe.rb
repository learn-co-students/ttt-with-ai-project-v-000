require 'pry'

class TicTacToe
  def call
    puts "Welcome to Tic::Tac::Toe!"

    run_game(ask_num_player, goes_first)
  end

  def run_game(num_players, goes_first_token)
    case num_players.to_i
      when 0
        zero_game(goes_first_token)
        again?
      when 1
        one_game(goes_first_token)
        again?
      when 2
        two_game(goes_first_token)
        again?
      else
        puts "I couldn't understand that, please try again."
    end
  end

  def zero_game(goes_first_token)
    if goes_first_token == "X"
      game = Game.new(Player::Computer.new("X"),Player::Computer.new("O"))
    else
      game = Game.new(Player::Computer.new("O"),Player::Computer.new("X"))
    end
    game.play
  end

  def one_game(goes_first_token)
    if goes_first_token == "X"
      game = Game.new(Human.new("X"),Computer.new("O"))
    else
      game = Game.new(Computer.new("O"),Human.new("X"))
    end
    game.play
  end

  def two_game(goes_first_token)
    if goes_first_token == "X"
      game = Game.new(Human.new("X"),Human.new("O"))
    else
      game = Game.new(Human.new("O"),Human.new("X"))
    end
    game.play
  end

  def ask_num_player
    puts "How many players for this game 0, 1, or 2?"
    num_players = gets.chomp
  end

  def goes_first # return "X" or "O"
    puts "Who goes first? X or O"
    first = gets.chomp.upcase
  end

  def again?
    puts "Wanna play again? (Y/N)"
    input = gets.strip.upcase

    if input == "Y"
      run_game(ask_num_player, goes_first)
    elsif input == "N"
      puts "Thanks for playing Tic::Tac::Toe!"
      exit
    else
      puts "I didn't understand, please try again."
      again?
    end
  end
end




# Ask the user for who should go first and be "X".

# Use the input to correctly initialize a Game with the appropriate player types and token values.

# When the game is over, the CLI should prompt the user if they would like to play again and allow 
# them to choose a new configuration for the game as described above. If the user doesn't want
# to play again, exit the program.