class Welcome
  attr_accessor :valid

  def initialize
    @valid = InputValid.new
  end

  def greeting
    puts "Welcome to Zee's TicTacToe Game"
    stop_game = false
    until stop_game do
        game = game_type(player_number_selection)
        game.board.display
        game.play
        stop_game = end_game
    end
  end

  def player_number_selection
    puts 'How many players will be playing? 0, 1, or 2'
    input = gets.strip
    if @valid.digits?(input) && @valid.in_range?(input.to_i)
      input.to_i
    else
      @valid.invalid
      player_number_selection
    end
  end

  def game_type(game_selection)
    case game_selection
      when 0
        puts 'You have choosen to watch the computer play itself.'
        computer_game
      when 1
        puts 'You have choosen a one player mode.'
        get_token_selection
      when 2
        puts 'You have choosen a two player mode.'
        human_game
      end
  end

  def quite(input)
    x = input[0]
    if x == 'n'
      puts "Great! Lets play again\nGood Luck! = D"
    else
      abort
    end
  end

  def end_game
    puts "Would you like to quite? yes(y) or no(n)"
    input = gets.strip.downcase
    if @valid.yes_no?(input)
      quite(input)
    else
      @valid.invalid
      end_game
    end
  end

  def computer_game
    puts 'Can the computer beat itself?'
    game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'), Board.new)
  end

  def human_x
    puts "Good Luck trying to beat the computer!"
    game = Game.new(Players::Human.new('X'), Players::Computer.new('O'), Board.new)
  end

  def cpu_x
    puts "Good Luck trying to beat the computer!"
    game = Game.new(Players::Computer.new('X'), Players::Human.new('O'), Board.new)
  end

  def human_game
      puts 'Who will outwhit who? Good Luck!'
      game = Game.new(Players::Human.new('X'), Players::Human.new('O'), Board.new)
  end

  def get_token_selection
    puts 'Player 1, would you like to be "X"? yes(y) or no(n)'
    input = gets.strip
    if @valid.letters?(input) && @valid.yes_no?(input)
      token_selection(input)
    else
      @valid.invalid
      get_token_selection
    end
  end

  def token_selection(string)
    x = string[0]
    if x == 'y'
      human_x
    else
     cpu_x
    end
  end
end
