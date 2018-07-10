class Cli
  attr_accessor :num_players, :going_first

  def call
    puts "Hello! Welcome to Tic-Tac-Toe! type 'exit' during the game to quit"

    how_many_players
    first? unless num_players == "0"

    case
    when num_players == "0"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
    when num_players == "1" && going_first == 'me'
      Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
    when num_players == "1" && going_first == 'not me'
      Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
    when num_players == "2"
      Game.new.play
    end
    play_again?
  end

  def first?
    puts "Who would like to go first and be X? ('me' or 'not me')"
    input = gets.strip
    if input == 'me'
      @going_first = 'me'
    elsif input == 'not me'
      @going_first = 'not me'
    else
      "invalid input"
      first?
    end
  end

  def how_many_players
    puts "Would you like to play a 0, 1, or 2 player game?"
    input = gets.strip
    case
    when input == "0"
      @num_players = "0"
    when input == "1"
      @num_players = "1"
    when input == "2"
      @num_players = "2"
    else
      "Invalid Input"
      how_many_players
    end
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    input = gets.strip
    if input == "y"
      Cli.new.call
    elsif input == "n"
    else
      "Invalid Input"
    end
  end
end
