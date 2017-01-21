class CLI
  def start
    puts "Welcome to TicTacToe!"
    sleep 1
    play_again = 'y'
    while play_again.downcase == 'y' || play_again.downcase == 'yes'
      puts "**You can always press CRTL+C to terminate the game.**"
      sleep 1.2
      puts "How many players?"
      sleep 0.5
      puts "0\n1\n2"
      input = gets.strip.to_i

      if input == 0
        puts "BEEP BOOP...Calculating..."
        sleep 1.5
        player_1 = Players::Computer.new('X')
        player_2 = Players::Computer.new('O')
        Game.new(player_1, player_2).play

      elsif input == 1
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

      elsif input == 2
        player_1 = Players::Human.new('X')
        player_2 = Players::Human.new('O')
        Game.new(player_1, player_2).play

      else
        puts "Invalid Entry\n\n"
        sleep 1
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
