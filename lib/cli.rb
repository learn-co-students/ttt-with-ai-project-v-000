class Cli

  attr_accessor :game

  def initialize
  end

  def welcome
    print "\nWelcome to TTT CLI!\n"
    print "The Leader in Tic-Tac-Toe Command Line Interfaces!\n\n"
    self.setup_game
  end

  def play_game
    self.game.play
    self.play_again?
  end

  def create_game(num_players, first_player, difficulty = 1)
    if first_player == 1
      if num_players == 0
        player_1 = Players::Computer.new("X", difficulty)
        player_2 = Players::Computer.new("O", difficulty)
      elsif num_players == 1
        player_1 = Players::Human.new("X")
        player_2 = Players::Computer.new("O", difficulty)
      elsif num_players == 2
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
      end
    elsif first_player == 2
      if num_players == 0
        player_1 = Players::Computer.new("O", difficulty)
        player_2 = Players::Computer.new("X", difficulty)
      elsif num_players == 1
        player_1 = Players::Human.new("O")
        player_2 = Players::Computer.new("X", difficulty)
      elsif num_players == 2
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
      end
    end
    self.game = Game.new(player_1, player_2)
    self.play_game
  end

  def play_again?
    puts "Play another game (y/N)?"
    yn = gets.strip.upcase

    if yn[0] == "Y"
      puts "Do you want to change the settings (y/N?"
      yn = gets.strip.upcase
      if yn[0] == "Y"
        self.setup_game
      else
        self.game.board.reset!
        self.play_game
      end
    else
      puts "Thanks for playing!"
    end
  end

  def integer_input_validation_loop(validation, prompt = "")
    puts prompt
    input = gets.strip
    valid = false
    while !valid do
      valid = validation.(input)
      input = gets.strip if !valid
    end
    return input
  end

  def setup_game
    game_type = ->(num_players) do
      if num_players == "0" || num_players == "2"
        return true
      elsif num_players == "1"
        puts "In a single player game, Player 1 will be human while Player 2 will be computer."
        return true
      else
        puts "Invalid selection!"
        puts "Please enter 0, 1 or 2."
        return false
      end
    end
    num_players = self.integer_input_validation_loop(game_type, "Will there be 0, 1 or 2 players?")

    go_first = ->(first_player) do

      if (first_player == "1" || first_player == "2" ) && (num_players == "1" || num_players == "2" || num_players == "0")
        return true
      else
        puts "Invalid selection!"
        puts "Please enter 1 or 2."
        return false
      end
    end
    first_player = self.integer_input_validation_loop(go_first, "Should Player 1 or Player 2 play X and go first?")

    set_difficulty = ->(difficulty) do
      if difficulty == "1" || difficulty == "2" || difficulty == "3" || difficulty == "4" || difficulty == "5" || difficulty == "6" || difficulty == "7" || difficulty == "8" || difficulty == "9"
        return true
      else
        puts "Invalid selection!"
        puts "Please enter a number 1-9."
        return false
      end
    end

    num_players == "2" ? difficulty = "1" : difficulty = self.integer_input_validation_loop(set_difficulty, "What difficulty level for the computer players (1-9)?")


    self.create_game(num_players.to_i, first_player.to_i, difficulty.to_i)

  end
end
