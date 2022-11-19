class Cli
  attr_reader :winning_token

  def initialize
  end

  def call
    puts "\nWelcome to Tic Tac Toe!\n
What type of game would you like to play?\n
Enter a letter from the list below to choose.\n
    A) Two players (player vs player)
    B) One player (player vs computer)
    C) Zero players (computer vs computer)
    D) WARGAMES!!\n"
    run_game
  end

  def run_game
    input = gets.strip.downcase
    if input == "a"
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      puts "\nX will play the first move. Get ready, X!"
      game.play
      @winning_token = game.winner
      game.won? ? win_msg : draw_msg
      play_again
    elsif input == "b"
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      game.play
      @winning_token = game.winner
      game.won? ? win_msg : draw_msg
      play_again
    elsif input == "c"
      game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      game.play
      @winning_token = game.winner
      game.won? ? win_msg : draw_msg
      play_again
    elsif input == "d"
      wargames
      play_again
    else
      puts "Invalid choice"
      run_game
    end
  end

  def win_msg
    puts "\nCongratulations, #{winning_token}! You've won the game!"
  end

  def draw_msg
    puts "\nCat's Game! Draw! No winner!"
  end

  def play_again
    puts "\nWould you like to play another round? (Y/N)"
    reply = gets.strip.downcase
    if reply == "y"
      puts "\nFor two-player games, last round's loser should play the first move as X this time."
      sleep 0.75
      call
    else
      sleep 0.75
      puts "\nGoodbye!"
    end
  end

  def wargames
    puts "\n" + "100 rounds of computer vs. computer.
Will either side be able to win?
Let's hope not--the fate of the world is at stake!"
    sleep 3
    puts "Wargames commencing... NOW!"
    sleep 1
    rounds = 0
    wins = 0
    game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
    until rounds == 100
      board.reset!
      game.play
      rounds += 1
      if game.won?
        wins += 1
      end
    end
    puts "\nWargames complete. There have been #{wins} wins."
    if wins > 0
      puts "\nCountdown to nuclear annihilation commencing..."
      countdown = 11
      until countdown == 0
        countdown -= 1
        puts countdown
        sleep 1
      end
      puts "\nGoodbye."
      sleep 1.5
      the_end
    elsif wins == 0
      puts "\nCrisis averted. The planet survives...
...for now."
    end
  end

  def the_end
  puts "\n                 ________________"
  puts "            ____/ (  (    )   )  \\___"
  puts "          /( (  (  )   _    ))  )   )\\"
  puts "         ((     (   )(    )  )   (   )  )"
  puts "       ((/  ( _(   )   (   _) ) (  () )  )"
  puts "      ( (  ( (_)   ((    (   )  _((_ ) _  )_"
  puts "     ( (  )    (      (  )    )   ) _ ) (   )"
  puts "    (  (   (  (   ) (  _  ( _) )_  ) _ ) ) ( )"
  puts "    ( (  (   ) (  )   (  ))     ) _)(   )  )  )"
  puts "   ( (  ( \\\) (    (_  ( ) ( )  )   ) )  ))   ( )"
  puts "    (  (   (  (   (_ ( ) ( _    )  ) (  )  )   )"
  puts "   ( (  ( (  (  )     (_  )  ) )  _)   ) _( (  )"
  puts "    ((  (   )(    (     _    )   _) _(_ (  (_ )"
  puts "     (_((__(_(__(( ( ( |  ) ) ) )_))__))_)___)"
  puts "     ((__)        \\\\||lll|l||///         \\\\_))"
  puts "              (   /(/ (  )  ) )\\\\   )"
  puts "            (    ( ( ( | | ) ) )\\\\   )"
  puts "             (   /(| / ( )) ) ) )) )"
  puts "           (     ( ((((_(|)_)))))     )"
  puts "            (      ||\\(|(|)|/||     )"
  puts "          (        |(||(||)||||        )"
  puts "            (     //|/l|||)|\\ \\\     )"
  puts "          (/ / //  /|//||||\\  \\ \\ \\ \\ _)"
  puts "------------------------------------------------------"
  end

end
