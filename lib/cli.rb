class CLI

  def start_game
    players = ""
    until players == "0" || players == "1" || players == "2" || players == "wargames"
      sleep(0.5)
      puts "How many players? Enter 0-2:"
      print ">"
      players = gets.strip.downcase
      if players != "0" && players != "1" && players != "2" && players != "wargames"
        puts "Invalid number of players."
      elsif players == "wargames"
      end
    end

    starter = ""
    until starter == "X" || starter == "O"
      sleep(0.5)
      puts "Who's starting? Enter X or O:"
      print ">"
      starter = gets.strip.upcase
      if starter != "X" && starter != "O"
        puts "Invalid player token."
      end
    end
    sleep(0.5)
    puts "Ok then, #{starter} will start the #{players}-player game!\n "

    opponent = ""
    if starter == "X"
      opponent = "O"
    elsif starter == "O"
      opponent = "X"
    end

    if players == "0" || players == "wargames"
      player_1 = Players::Computer.new(starter)
      player_2 = Players::Computer.new(opponent)
    elsif players == "1"
      if starter == "X"
        player_1 = Players::Human.new(starter)
        player_2 = Players::Computer.new(opponent)
      elsif starter == "O"
        player_1 = Players::Computer.new(starter)
        player_2 = Players::Human.new(opponent)
      end
    elsif players == "2"
      player_1 = Players::Human.new(starter)
      player_2 = Players::Human.new(opponent)
    end

    if players != "wargames"
      game = Game.new(player_1, player_2)
      sleep(1)
      game.board.display
      game.play
      loop_game
    elsif players == "wargames"
      puts "WARGAMES!"
      100.times do
        game = Game.new(player_1, player_2)
        game.play
        sleep(0.5)
      end
      loop_game
    end
  end # start_game

  def loop_game
    another = ""
    until another == "y" || another == "n"
      puts "Would you like to play another?"
      print ">"
      another = gets.strip.downcase
      if another != "y" && another != "n"
        puts "Invalid response."
      elsif another == "y"
        puts "Okay!"
        start_game
      elsif another == "n"
        puts "K bye!"
      end
    end
  end #loop game

end
