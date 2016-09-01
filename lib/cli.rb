require 'pry'
class CLI
  # 0 player is computer vs computer
  # 1 player is computer vs user
  # 2 player is user vs user

  def start_game
    puts "Welcome to the game of Tic-Tac-Toe"
    puts "How many players do you want (0-2)"
    entry = nil
    while entry != "0" || entry != "1" || entry != "2"
    entry = gets.strip

      if entry == "0"
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
      elsif entry == "1"
        puts "Computer is X and Human is O"
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"))
      elsif entry == "2"
        puts "Which player should be X? Player 1 or Player 2 (please enter only a 1 or 2)?"


        which_player = gets.strip
          if which_player == "1"
            game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
          elsif which_player == "2"
            game = Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Human.new("X"))
          end
        end
      while !game.over?
        game.play
      end
      if game.won? || game.draw?
        play_again = nil
        puts "Thanks for playing!"

        while play_again != "y" || play_again != "n"
          puts "Would you like to play again? (y or n)"
          play_again = gets.strip

          if play_again == "y"
            start_game
          elsif play_again == "n"
              puts "Thanks for playing! Until next time!"
              return "Thanks"
          end
        end
      end
    end

  end



end
