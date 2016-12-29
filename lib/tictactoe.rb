module TicTacToe
  module_function

  def play
    welcome_message
    sleep(1)
    @game = initialize_game
    @game.play
    play_again?
  end

  def welcome_message
    puts 'Welcome to Tic Tac Toe!'
  end

  def initialize_game
    puts '', 'How many humans will be playing today? (press 0, 1 or 2 and hit <return>)'
    players = gets.chomp
    case players
    when '0'
      zero_player_game
    when '1'
      one_player_game
    when '2'
      two_player_game
    else
      initialize_game
    end
  end

  def zero_player_game
    puts '', 'Is the first computer smart or dumb? (smart/dumb)'
    computer_1 = Players::Computer.new('X')
    computer_1.intelligence = get_computer_intelligence
    puts '', 'Is the second computer smart or dumb? (smart/dumb)'
    computer_2 = Players::Computer.new('O')
    computer_2.intelligence = get_computer_intelligence
    puts '', 'War Games? (y/n)'
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

  def one_player_game
    get_tokens
    human    = Players::Human.new("#{@token}")
    computer = Players::Computer.new("#{@cpu_token}")
    puts '', 'Is the computer smart or dumb? (smart/dumb)'
    computer.intelligence = get_computer_intelligence
    get_player_order(human, computer)
  end

  def get_tokens
    puts '', 'Would you like to be X or O? (x/o)'
    @token = gets.chomp.upcase
    return get_tokens if @token != 'X' && @token != 'O'
    @cpu_token = @token == 'X' ? 'O' : 'X'
  end

  def get_computer_intelligence
    @intelligence = gets.chomp.downcase
    return get_computer_intelligence if @intelligence != 'smart' && @intelligence != 'dumb'
    @intelligence
  end

  def get_player_order(human, computer)
    puts '', 'Would you like to go first? (y/n)'
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

  def play_again?
    sleep(1)
    puts '', 'Play again? (y/n)'
    input = gets.chomp.downcase
    case input
    when 'y'
      rematch?
    when 'n'
      nil
    else
      play_again?
    end
  end

  def rematch?
    puts '', 'Rematch? (y/n)'
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
end