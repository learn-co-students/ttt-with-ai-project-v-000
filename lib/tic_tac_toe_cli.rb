class TicTacToeCLI

  def initialize
    puts "Welcome to Tic Tac Toe!"
  end

  def start
    puts "What kind of game would you like to play? Enter:\n'1' to play against a friend\n'2' to play against the Computer\n'3' to see the Computer play against itself\n'wargames' to see the Computer play against itself 100 times"
    input = gets.strip
    system('clear')
    case input
      when "1"
        option_1
      when "2"
        option_2
      when "3"
        option_3
      when "wargames"
        wargames_option
      else
        puts "Invalid selection."
        start
    end
    play_again?
  end

  private

  attr_accessor :token_input

  def play_again?
    puts "Would you like to play again? (y/n)"
    play_input = gets.strip.downcase
    if play_input == "y"
      system('clear')
      start
    elsif play_input == "n"
      puts "Thanks for playing. Goodbye!"
    else
      puts "Invalid entry."
      play_again?
    end
  end

  def token_selection
    puts "Would you like to be 'X' or 'O'?"
    self.token_input = gets.strip.upcase
    if token_input == "X" || token_input == "O"
      token_input
    else
      puts "Invalid selection."
      token_selection
    end
  end

  def option_1 # Human vs. Human
    puts "Decide who will go first. Player 1:"
    token_selection
    if token_input == "X"
      Game.new.play
    elsif token_input == "O"
      Game.new(Players::Human.new("O"), Players::Human.new("X")).play
    end
  end

  def option_2 # Human vs. Computer
    puts "Would you like to go first? (y/n)"
    play_first = gets.strip.downcase
    if play_first == "y"
      token_selection
      if token_input == "X"
        Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
      elsif token_input == "O"
        Game.new(Players::Human.new("O"), Players::Computer.new("X")).play
      end
    elsif play_first == "n"
      token_selection
      if token_input == "X"
        Game.new(Players::Computer.new("O"), Players::Human.new("X")).play
      elsif token_input == "O"
        Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
      end
    else
      puts "Invalid entry."
      option_2
    end
  end

  def option_3 # Computer vs. Computer
    Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
  end

  def wargames_option # Computer vs. Computer 100 times with outcomes
    Game.new(Players::Computer.new("X"), Players::Computer.new("O")).wargames
  end

end
