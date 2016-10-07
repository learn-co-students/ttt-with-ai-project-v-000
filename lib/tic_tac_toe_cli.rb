class Cli

  def initialize
  end

  def call
    puts
    puts "Welcome to Tic Tac Toe!"
    puts
    start
  end

  def start
    puts "What type of game would you like to play? Enter a letter from this list to choose."
    puts
    puts "A) Two players (player vs player)"
    puts "B) One player (player vs computer)"
    puts "C) Zero players (computer vs computer)"
    puts "D) WARGAMES!!"
    puts
    menu_selection
  end

  def menu_selection
    input = gets.strip.downcase
    if input == "a"
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      puts
      puts "X will play the first move. Get ready, X!" #implement a "coin flip" to help players decide who goes first?
      puts
      game.play
      play_again
    elsif input == "b"
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      puts
      game.play
      play_again
    elsif input == "c"
      game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      puts
      game.play
      play_again
    elsif input == "d"
      wargames
      play_again
    else
      puts
      puts "Invalid choice"
      puts
      start
    end
  end

  def play_again
      puts "Would you like to play another round? (Y/N)"
      puts
      reply = gets.strip.downcase
      if reply == "y"
        puts
        puts "For two-player games, last round's loser should play the first move as X this time."
        puts
        sleep(1)
        start
      else
        sleep(1)
        puts
        puts "Goodbye!"
        puts
      end
  end

  def wargames
    puts
    puts "  100 rounds of computer vs. computer.
  Will either side be able to win?
  Let's hope not--the fate of the world is at stake!"
    sleep(1)
    puts "  Wargames commencing... NOW!"
    sleep(1)
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
    puts "WARGAMES COMPLETED. There have been #{wins} wins."
    puts
    if wins > 0
      puts "Countdown to nuclear annihilation commencing..."
      countdown = 11
      until countdown == 0
        countdown -= 1
        puts
        puts countdown
        sleep(1)
        puts
      end
      puts "Goodbye."
      sleep(1.5)
      puts
      puts the_end
    elsif wins == 0
      puts "Crisis averted. The planet survives..."
      puts "...for now."
      puts
    end
  end

  def win_msg
    puts
    puts "Congratulations, #{winner}!"
    puts
    puts "You've won the game!"
    sleep(0.33)
    puts
  end

  def the_end
  puts "                 ________________
  "
  puts "            ____/ (  (    )   )  \___
  "
  puts "          /( (  (  )   _    ))  )   )\
  "
  puts "         ((     (   )(    )  )   (   )  )
  "
  puts "       ((/  ( _(   )   (   _) ) (  () )  )
  "
  puts "      ( (  ( (_)   ((    (   )  .((_ ) .  )_
  "
  puts "     ( (  )    (      (  )    )   ) . ) (   )
  "
  puts "    (  (   (  (   ) (  _  ( _) ).  ) . ) ) ( )
  "
  puts "    ( (  (   ) (  )   (  ))     ) _)(   )  )  )
  "
  puts "   ( (  ( \\\) (    (_  ( ) ( )  )   ) )  )) ( )
  "
  puts "    (  (   (  (   (_ ( ) ( _    )  ) (  )  )   )
  "
  puts "   ( (  ( (  (  )     (_  )  ) )  _)   ) _( ( )
  "
  puts "    ((  (   )(    (     _    )   _) _(_ (  (_ )
  "
  puts "     (_((__(_(__(( ( ( |  ) ) ) )_))__))_)___)
  "
  puts "     ((__)        \\\\||lll|l||///          \\\\_))
  "
  puts "              (   /(/ (  )  ) )\\\\   )
  "
  puts "            (    ( ( ( | | ) ) )\\\\   )
  "
  puts "             (   /(| / ( )) ) ) )) )
  "
  puts "           (     ( ((((_(|)_)))))     )
  "
  puts "            (      ||\\(|(|)|/||     )
  "
  puts "          (        |(||(||)||||        )
  "
  puts "            (     //|/l|||)|\\ \\\     )
  "
  puts "          (/ / //  /|//||||\\  \\ \\ \\ \\ _)
  "
  puts "------------------------------------------------------
  "
  puts
  end

end
