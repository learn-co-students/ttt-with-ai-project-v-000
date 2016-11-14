class TicTacToeCLI

  def initialize

  end

  # Checks input received from .start to see if valid. If not, returns an error.
  def input_check(input, array)
    while !array.include?(input)
      puts "Sorry, your input was invalid. Try again."
      input = gets.chomp
    end
    input
  end

  def start
    exit = false
    while !exit
      puts "Welcome to Tic Tac Toe."

      # Chooses whether players will be human, computer, or both.
      print "How many humans will be playing? (0,1,2): "
      human_players = input_check(gets.chomp, ["0","1","2"])
      puts "Starting the game with #{human_players} human player#{human_players == '1' ? '' : 's'}."

      if human_players == "0"
        player_1 = Players::Computer.new("X")
        player_2 = Players::Computer.new("O")

      # Determines whether the human player or the computer will go first.
      elsif human_players == "1"
        print "Who will go first, human or computer?: "
        first = input_check(gets.chomp, ["human","computer"])

        if first == "human"
          player_1 = Players::Human.new("X")
          player_2 = Players::Computer.new("O")
        else
          player_1 = Players::Computer.new("X")
          player_2 = Players::Human.new("O")
        end

        puts "The #{first} will go first."

      elsif human_players == "2"
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
      end

      # With the players set, the game is launched.
      game = Game.new(player_1,player_2)
      game.play

      # Determines whether another game will be played or not.
      print "Would you like to play again? (y,n): "
      newgame = input_check(gets.chomp, ["y","n"])
      exit = newgame.downcase == "y" ? false : true

    end

    puts "Thanks for playing Tic Tac Toe!"

  end

end
