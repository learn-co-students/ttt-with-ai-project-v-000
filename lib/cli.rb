class CLI
  attr_reader :player_one, :player_two

  def call
    puts "Welcome to Tic tac toe!\n\n"
    get_players
    board = GameTree.new.generate
    Game.new(@player_one, @player_two, board).turn
    play_again?
  end

  def get_players
    puts "Please select the number of human players or type exit."
    input = gets.strip.downcase

    if input == "exit"
      goodbye
    elsif valid_players?(input)
      create_players(input)
    else
      puts "Sorry, that's not a valid number of human players!\n\n"
      get_players
    end
  end

  def goodbye
    puts "Goodbye!"
    exit
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
    when "1"
      @player_one = Human.new('X')
      @player_two = Computer.new('O')
    when "0"
      @player_one = Computer.new('X')
      @player_two = Computer.new('O')
    end
  end
end