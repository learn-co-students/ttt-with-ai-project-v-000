class CLI
  attr_reader :player_one, :player_two, :board

  def call
    welcome
    get_players
    @board ||= GameTree.new.generate
    Game.new(player_one: @player_one, player_two: @player_two, board: @board).turn
    play_again?
  end

  def get_players
    input = gets.strip.downcase
    if input == "exit"
      goodbye
    elsif valid_players?(input)
      create_players(input)
      puts "\nLoading...\n\n"
    else
      puts "I don't understand you. Try again or type exit to quit."
      get_players
    end
  end

  def welcome
    puts ""
    puts "           TIC TAC TOE"
    puts ""
    puts "          Choose a game:     "
    puts ""
    puts "> Enter 2 for two players."
    puts "> Enter 1 to play the computer."
    puts "> Enter 0 to let the computer play itself."
    puts "> Enter `exit` to quit now."
    puts ""
  end

  def goodbye
    puts "Goodbye!"
    exit 0
  end

  def play_again?
    puts "Play again? y/n"
    gets.strip.downcase == "y" ? call : goodbye
  end

  def valid_players?(players)
    players[/[^\D]/] && players.to_i.between?(0, 2)
  end

  def create_players(players)
    case players
    when "2"
      @player_one = Human.new('X')
      @player_two = Human.new('O')
    when "1"
      @player_one = Human.new('X')
      @player_two = Computer.new('O')
    when "0"
      @player_one = Computer.new('X')
      @player_two = Computer.new('O')
    end
  end
end
