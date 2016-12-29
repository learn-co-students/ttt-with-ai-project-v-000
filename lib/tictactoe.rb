module TicTacToe
  module_function

  def play
    welcome_message
    sleep(1)
    initialize_game.play
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
    puts '', 'War Games? (y/n)'
    input = gets.chomp.downcase
    case input
    when 'y'
      WarGames.new(Players::Computer.new('X'), Players::Computer.new('O'))
    when 'n'
      Game.new(Players::Computer.new('X'), Players::Computer.new('O'))
    else
      zero_player_game
    end
  end

  def one_player_game
    get_tokens
    get_player_order
  end

  def get_tokens
    puts '', 'Would you like to be X or O? (x/o)'
    @token = gets.chomp.upcase
    return get_tokens if @token != 'X' && @token != 'O'
    @cpu_token = @token == 'X' ? 'O' : 'X'
  end

  def get_player_order
    puts '', 'Would you like to go first? (y/n)'
    input = gets.chomp.downcase
    case input
    when 'y'
      Game.new(Players::Human.new("#{@token}"), Players::Computer.new("#{@cpu_token}"))
    when 'n'
      Game.new(Players::Computer.new("#{@cpu_token}"), Players::Human.new("#{@token}"))
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
end