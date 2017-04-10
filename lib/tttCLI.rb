class TTTCLI

  def call
    start
  end

  def start
    puts "Hello, Joshua!"
    sleep 1
    puts "Shall We Play a Game?"
    sleep 1
    puts "How would you like to play?"
    sleep 1
    puts "Enter '1' to play me"
    sleep 1
    puts "Enter '2' to play another humangh (though I don't know why you would...)"
    sleep 1
    puts "or, if you wish..."
    sleep 1.5
    puts "Enter '3' for 'Nuclear' option"
    sleep 1
    puts "1\n2\n3"
      input = gets.strip


      if input.to_i == 3
        sleep 1
       puts "You've chosen Global Thermonuclear War!"
        sleep 0.8
        sleep 1
       puts "Let's hope I cannot beat myself and that the only option is not to play at all!"
          sleep 2
          x_wins = 0
          o_wins = 0
          draws = 0
          counter = 0
          until counter == 100
            player_1 = Players::Computer.new('X')
            player_2 = Players::Computer.new('O')
            game = Game.new(player_1, player_2)
            game.play
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
          player_1 = Players::Computer.new('X')
          player_2 = Players::Computer.new('O')
          Game.new(player_1, player_2).play
      end

      if input.to_i == 1
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
        puts "Invalid Entry"
        sleep 1.5
        start
      end

  end
end
