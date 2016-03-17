class GameCLI
  attr_accessor :player_one, :player_two
  attr_reader :game, :players

  def initialize
    puts 'Welcome to Tic Tac Toe!'
  end

  def call
    puts "Please select the number of human players (0, 1 or 2)"
    valid_players?(gets.chomp.to_i)
    Game.new(@player_one, @player_two).play
  end

  def valid_players?(players)
    if players.between?(0, 2)
      create_players(players)
    else
      puts "Sorry, this game only allows 0 to 2 human players!\n\n"
      call
    end
  end

  def create_players(players)
    case players
    when 2
      @player_one = Human.new('X')
      @player_two = Human.new('O')
    when 1
      @player_one = Human.new('X')
      @player_two = Computer.new('O')
    else
      @player_one = Computer.new('X')
      @player_two = Computer.new('O')
    end
  end
end