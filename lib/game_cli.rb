class GameCLI
  attr_accessor :player_one, :player_two
  attr_reader :game, :players

  def initialize
    puts 'Welcome to Tic Tac Toe!'
  end

  def call
    puts "Please select the number of human players or type exit to quit now."
    
    input = gets.chomp
    
    if input.downcase == 'exit'
      exit
    end

    valid_players?(input.to_i) ? create_players(input.to_i) : invalid_players
    Game.new(@player_one, @player_two).play
    play_again?
  end

  def play_again?
    puts "Play again? y/n"
    gets.chomp.downcase == "y" ? call : exit
  end

  def valid_players?(players)
    players.between?(0, 2) ? true : false
  end

  def invalid_players
    puts "Sorry, this game only allows 0 to 2 human players!"
    call
  end

  def create_players(players)
    case players
    when 1
      @player_one = Human.new('X')
      @player_two = Computer.new('O')
    when 0
      @player_one = Computer.new('X')
      @player_two = Computer.new('O')
    end
  end
end