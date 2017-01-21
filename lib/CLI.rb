require 'pry'

class CLI
  def start
    puts "Welcome to TicTacToe!"
    sleep 1
    play_again = 'y'
    while play_again.downcase == 'y' || play_again.downcase == 'yes'
      puts "**You can always press CRTL+C to terminate the game.**"
      sleep 1.5
      puts "How many players?"
      sleep 0.5
      puts "0\n1\n2"
      input = gets.strip


      if input.to_i == 0
        puts "Implement WARGAMES?"
        sleep 0.8
        puts"Yes\nNo\n\n"
        input = gets.strip

        if input.downcase == 'yes' || input.downcase == 'y'
          puts "Enjoy the show..."
          sleep 2
          x_wins = 0
          o_wins = 0
          draws = 0
          counter = 0
          until counter == 100
            player_1 = Players::Computer.new('X')
            player_2 = Players::Computer.new('O')
            game = Game.new(player_1, player_2) # had to set variable for Game.new
            game.play # had to seperate #play from Game.new #=> NoMethodError for game.winner below
              if game.winner == "X"
                x_wins +=1
              elsif game.winner == "O"
                o_wins +=1
              else
                draws +=1
              end
            counter +=1
          end
          puts "X won #{x_wins} times."
          puts "O won #{o_wins} times."
          puts "Game ended in draw #{draws} times."

        else
          puts "BEEP BOOP...Calculating..."
          sleep 1.5
          player_1 = Players::Computer.new('X')
          player_2 = Players::Computer.new('O')
          Game.new(player_1, player_2).play
        end

      elsif input.to_i == 1
        puts "Would you like to go first? (First player = X)"
        choice = gets.strip

        if choice.downcase == 'yes' || choice.downcase == 'y'
          player_1 = Players::Human.new('X')
          player_2 = Players::Computer.new('O')
          Game.new(player_1, player_2).play

        else choice.downcase == 'no' || choice.downcase == 'n'
          player_1 = Players::Computer.new('X')
          player_2 = Players::Human.new('O')
          Game.new(player_1, player_2).play
        end

      elsif input.to_i == 2
        player_1 = Players::Human.new('X')
        player_2 = Players::Human.new('O')
        Game.new(player_1, player_2).play

      else
        puts "Invalid Entry\n\n"
        sleep 1.5
        start
      end
      puts "Would you like to play again?"
      sleep 0.5
      puts"Yes\nNo\n\n"
        play_again = gets.strip
    end
    puts "Thanks for playing!"
    sleep 1
    abort
  end
end
