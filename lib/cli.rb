class Cli

  def self.greeting
    puts "Welcome to the hardest Tic Tac Toe game you will EVER play!"
    sleep(1.0)
    self.start_game
  end

  def self.start_game
    puts "What's your flavor of Tic-Tac-Toe, 0, 1 or 2 players?"
    game_type_input = gets.strip

    #Deterining which game
    if game_type_input == "0"
       game_type = Game.new(Players::Computer.new('X'), Players::Computer.new('O'), Board.new)
       self.play_game(game_type) #play_game method not yet built
    elsif game_type_input == "1"
      puts "Who will be 'X'? Human or Computer, please type your choice."
      who_goes_first_input = gets.strip.upcase

      #Distinquishing 0(Computer), 1(Human vs. Computer) or 2(Human vs. Human)
        case who_goes_first_input
        when "HUMAN"
          game_type = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
          self.play_game(game_type) #play_game method not yet built
        when "COMPUTER"
          game_type = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
        else
          puts "I did not understand your request."
          sleep(2)
          puts "Who will be 'X'? Human or Computer, please type your choice."
          who_goes_first_input = gets.strip.upcase
        end

      elsif game_type_input == "2"
        game_type = Game.new
        self.play_game(game_type) #play_game method not yet built

# I could put in a 'wargames' here, we'll see about that #
      else
        puts "I did not understand your request."
        sleep(2)
        self.start_game #Go to the top and do it again
    end
  end

  def self.play_game(game_type)
    game_type.play
    sleep(2)
    self.play_again?
  end

  def self.play_again?
    puts "Would you like to play again? Y/N"
    player_input = gets.strip.upcase
      if player_input == "Y"
        self.start_game
      elsif player_input == "N"
        sleep(3)
        puts "Hope you enjoyed your game!"
      else
        puts "I did not understand your request."
        self.play_again?
      end
  end

end
