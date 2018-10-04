class GameCLI
  attr_writer :num_players

  # CLI methods
  def self.greeting
    puts "Welcome to Tic Tac Toe!"
  end

  def self.game_type?
    puts "\nWould you like to:"
    puts "\t1. play with a friend,"
    puts "\t2. play against the computer, or"
    puts "\t3. watch two AIs play?"
    puts "\n"
    print "Enter you preferred option number: "
    num_players = gets.strip.to_i
  end

  def self.player_order(num_players)
    if num_players == 1
      # initialize with two human players
      puts "\nName your players. Player 1 will be X, player 2 will be O."
      print "Player 1: "
      first_player = gets.strip
      print "Player 2: "
      second_player = gets.strip
      puts "The competition begins. The prize: bragging rights!"
      # TODO: Add name attribute
      player_1 = Players::Human.new("X", first_player)
      player_2 = Players::Human.new("O", second_player)
      Game.new
    elsif num_players == 2
      # initialize with one human player and one computer player
      puts "\nWill you go first (X) or second (O)?"
      option = gets.strip
      puts "Man vs. machine: the eternal battle!"
      # Conditional for response to initialize game
      if option == "first"
        player_1 = Players::Human.new("X", "Me")
        player_2 = Players::Computer.new("O", "Watson")
      elsif option == "second"
        player_1 = Players::Computer.new("X", "Watson")
        player_2 = Players::Human.new("O", "Me")
      else
        puts "Invalid input. Please write first or second."
        puts "\n"
        player_order
      end
      Game.new
    elsif num_players == 3
      # initialize with two computer players
      puts "You know they'll always tie, right?"
      player_1 = Players::Computer.new("X", "Optimus Prime")
      player_2 = Players::Computer.new("O", "Megatron")
    else
      puts "Invalid input"
      puts "\n"
      Game.start
    end
  end

  def self.replay
    puts "Would you like to play again?"
    replay = gets.strip
  end

end