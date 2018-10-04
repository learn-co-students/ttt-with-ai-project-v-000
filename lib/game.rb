class Game
  attr_accessor :board, :player_1, :player_2, :num_players, :name
  @@num_players = 0

  # Win combinations constant
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # Left Diagonal
    [2, 4, 6]  # Right Diagonal
  ]

  # CLI methods
  def self.greeting
    puts "\nWelcome to Tic Tac Toe!"
  end

  def self.game_type?
    puts "\nWould you like to:"
    puts "\t1. play with a friend,"
    puts "\t2. play against the computer, or"
    puts "\t3. watch two AIs play?"
    puts "\n"
    print "Enter you preferred option number: "
    @@num_players = gets.strip.to_i
    num_players_valid?(@@num_players)
  end

  def self.num_players_valid?(num_players)
    if !num_players.between?(1, 3)
      puts "\nInvalid input. Please enter 1, 2, or 3."
      Game.game_type?
    end
  end

  def self.player_order?
    if @@num_players == 1
      # initialize with two human players
      puts "\nName your players. Player 1 will be X, player 2 will be O."
      print "Player 1: "
      first_player = gets.strip
      print "Player 2: "
      second_player = gets.strip
      puts "\nThe competition begins. The prize: bragging rights!"
      player_1 = Players::Human.new("X", first_player)
      player_2 = Players::Human.new("O", second_player)
    elsif @@num_players == 2
      # initialize with one human player and one computer player
      puts "\nWhat is your name?"
      player_name = gets.strip
      puts "\nWould you like to go first (X) or second (O)? "
      order = gets.strip
      puts "\nMan vs. machine: the eternal battle!"
      # Conditional for response to initialize game
      if order == "first"
        player_1 = Players::Human.new("X", player_name)
        player_2 = Players::Computer.new("O", "Watson")
      elsif order == "second"
        player_1 = Players::Computer.new("X", "Watson")
        player_2 = Players::Human.new("O", player_name)
      else
        puts "\nInvalid input. Please enter first or second."
        player_order?
      end
    elsif @@num_players == 3
      # initialize with two computer players
      puts "\nYou know they'll always tie, right?"
      player_1 = Players::Computer.new("X", "Optimus Prime")
      player_2 = Players::Computer.new("O", "Megatron")
    end
    game = Game.new(player_1, player_2)
    game.play
    # binding.pry
  end

  def self.replay?
    puts "\nWould you like to play again?"
    replay = gets.strip
    if replay.match(/y/i) || replay.match(/yes/i)
      play
    else
      puts "\nGood game!"
      exit
    end
  end

  def self.play
    Game.greeting
    Game.game_type?
    Game.player_order?
    Game.replay?
  end
  
  # Game methods
  def initialize(player_1 = Players::Human.new("X", name), player_2 = Players::Human.new("O", name), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    # THIS FUCKING SUCKEDDDD
    win = false
    WIN_COMBINATIONS.each do |combo|
      win = combo if check_combo(combo)
    end
    win
  end

  # #won? helper method
  def check_combo(combo)
    win = false
    poss_win = []
    combo.each {|i| poss_win << board.cells[i]}
    win = combo if poss_win == ["X", "X", "X"] || poss_win == ["O", "O", "O"]
    win
  end

  def draw?
    board.full? && !won?
  end

  def over?
    board.full? || draw? || won?
  end

  def winner
    board.cells[won?&.first] if won?
  end
  
  def turn
    print "\nYour turn, #{current_player.name}! To make your move, enter a number 1-9: "
    input = current_player.move(board)
    if current_player.name == "Optimus Prime" || current_player.name == "Megatron" || current_player.name == "Watson"
      puts "#{input}"
    end
    if !board.valid_move?(input)
      puts "Invalid move."
      turn
    else
      board.update(input, current_player)
    end
  end

  def play
    while !over?
      turn
      board.display
    end
    won? ? (puts "\nCongratulations #{winner}! You win!") : (puts "\nCat's Game!")
    
  end

end