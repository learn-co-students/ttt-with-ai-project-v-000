class CLI

  def start
    greeting
    game_type?
    player_order?
    @game = Game.new(@player_1, @player_2, Board.new).play
    replay?
  end

  # CLI methods
  def greeting
    puts "\nWelcome to Tic Tac Toe!"
  end

  def game_type?
    @num_players = 0
    puts "\nWould you like to:"
    puts "\t1. play with a friend,"
    puts "\t2. play against the computer, or"
    puts "\t3. watch two AIs play?"
    puts "\n"
    print "Enter you preferred option number: "
    @num_players = gets.strip.to_i
    num_players_valid?(@num_players)
  end

  def num_players_valid?(num_players)
    if !num_players.between?(1, 3)
      puts "\nInvalid input. Please enter 1, 2, or 3."
      game_type?
    end
  end

  def player_order?
    if @num_players == 1
      # initialize with two human players
      puts "\nName your players. Player 1 will be X, player 2 will be O."
      print "Player 1: "
      first_player = gets.strip
      print "Player 2: "
      second_player = gets.strip
      puts "\nThe competition begins. The prize: bragging rights!"
      @player_1 = Players::Human.new("X", first_player)
      @player_2 = Players::Human.new("O", second_player)
    elsif @num_players == 2
      # initialize with one human player and one computer player
      puts "\nWhat is your name?"
      player_name = gets.strip
      puts "\nWould you like to go first (X) or second (O)? "
      order = gets.strip
      puts "\nMan vs. machine: the eternal battle!"
      # Conditional for response to initialize game
      if order == "first"
        @player_1 = Players::Human.new("X", player_name)
        @player_2 = Players::Computer.new("O", "Watson")
      elsif order == "second"
        @player_1 = Players::Computer.new("X", "Watson")
        @player_2 = Players::Human.new("O", player_name)
      else
        puts "\nInvalid input. Please enter first or second."
        player_order?
      end
    elsif @num_players == 3
      # initialize with two computer players
      puts "\nYou know they'll always tie, right?"
      @player_1 = Players::Computer.new("X", "Optimus Prime")
      @player_2 = Players::Computer.new("O", "Megatron")
    end
  end

  def replay?
    puts "\nWould you like to play again?"
    replay = gets.strip
    if replay.match(/y/i) || replay.match(/yes/i)
      start
    else
      puts "\nGood game!"
      exit
    end
  end

end