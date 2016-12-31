module TicTacToeCLI
  module_function

  # Welcome the user(s) and start the game loop.
  def play
    puts '', '- - - Welcome to Tic Tac Toe! - - -'.bold.yellow
    sleep(1)
    @game = initialize_game
    @game.play
    play_again?
  end

  # Get the number of players and initialize the appropriate game type.
  def initialize_game
    puts '', 'How many humans will be playing today? ' + '(press 0, 1 or 2 and hit <return>)'.blue
    players = gets.chomp
    case players
    when '0'
      zero_player_game
    when '1'
      one_player_game
    when '2'
      two_player_game
    else
      puts '', 'Input must be 0, 1, or 2'.bold.red
      initialize_game
    end
  end

  # The computer plays itself. Either 'player' can be smart (plays with strategy) or dumb (plays randomly).
  # The user can select War Games or a single game.
  def zero_player_game
    puts '', 'Is the first computer smart or dumb? ' + '(smart/dumb)'.blue
    computer_1 = Players::Computer.new('X')
    computer_1.intelligence = get_computer_intelligence

    puts '', 'Is the second computer smart or dumb? ' + '(smart/dumb)'.blue
    computer_2 = Players::Computer.new('O')
    computer_2.intelligence = get_computer_intelligence

    puts '', 'War Games? ' + '(y/n)'.blue
    input = gets.chomp.downcase
    case input
    when 'y'
      WarGames.new(computer_1, computer_2)
    when 'n'
      Game.new(computer_1, computer_2)
    else
      zero_player_game
    end
  end

  # The user plays the computer. The user can select their token, the intelligence of the computer opponent, and
  # whether they want to go first or second.
  def one_player_game
    get_tokens
    human    = Players::Human.new("#{@token}")
    computer = Players::Computer.new("#{@cpu_token}")
    puts '', 'Is the computer smart or dumb? ' + '(smart/dumb)'.blue
    computer.intelligence = get_computer_intelligence
    get_player_order(human, computer)
  end

  # Gets the player's preferred token and sets the computer's token based on the choice.
  def get_tokens
    puts '', 'Would you like to be X or O? ' + '(x/o)'.blue
    @token = gets.chomp.upcase

    if @token == 'X' || @token == 'O'
      @cpu_token = @token == 'X' ? 'O' : 'X'
    else
      get_tokens
    end
  end

  # Lets the user pick a smart or dumb opponent.
  def get_computer_intelligence
    @intelligence = gets.chomp.downcase
    if @intelligence == 'smart' || @intelligence == 'dumb'
      @intelligence
    else
      get_computer_intelligence
    end
  end

  # Lets the user pick if they want to go first or second, and initializes the game.
  def get_player_order(human, computer)
    puts '', 'Would you like to go first? ' + '(y/n)'.blue
    input = gets.chomp.downcase
    case input
    when 'y'
      Game.new(human, computer)
    when 'n'
      Game.new(computer, human)
    else
      get_player_order
    end
  end

  # Initializes a Human vs. Human. Player's can select which token will go first. X first is default Game setting.
  def two_player_game
    puts '', "X's or O's first? (x/o)"
    input = gets.chomp.downcase
    case input
    when 'x'
      Game.new
    when 'o'
      Game.new(Players::Human.new('O'), Players::Human.new('X'))
    else
      two_player_game
    end
  end

  # Ask the user if they want to play again. If yes, ask if they want a rematch of the same game format.
  # If not, say goodbye with style.
  def play_again?
    puts '', 'Play again? ' + '(y/n)'.blue
    input = gets.chomp.downcase
    case input
    when 'y'
      rematch?
    when 'n'
      goodbye
    else
      play_again?
    end
  end

  # Ask the user if they want a rematch. If yes, reset the board and restart the same game within a new game loop.
  # If not, initialize a brand new game with new game options and start a new game loop.
  def rematch?
    puts '', 'Rematch? ' + '(y/n)'.blue
    input = gets.chomp.downcase
    case input
    when 'y'
      @game.board.reset!
      @game.play
      play_again?
    when 'n'
      @game = initialize_game
      @game.play
      play_again?
    else
      rematch?
    end
  end

  # Print a rainbow goodbye.
  def goodbye
    puts '', ''
    msg = ['g '.red, 'o '.yellow, 'o '.magenta, 'd '.blue, 'b '.cyan, 'y '.green, 'e '.red]
    scroll_message(msg)
    flash_message(msg)
    puts '', ''
  end

  # Flash it 20 times.
  def flash_message(msg)
    20.times do
      print "\r              "
      sleep(0.02)
      print "\r"
      msg.each { |l| print l }
      sleep(0.05)
    end
  end

  # Scroll it twice.
  def scroll_message(msg)
    2.times do
      print "\r"
      msg.each do |l|
        print l
        sleep(0.02)
      end
      sleep(0.1)
      print "\r              "
    end
  end
end
