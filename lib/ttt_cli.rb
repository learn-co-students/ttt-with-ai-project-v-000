class TicTacToeCli


  def initialize
    puts "Welcome to Tic Tac Toe!"
    new_game
  end

  def new_game
    puts "What kind of game would you like to play?" 
    puts "Enter 0 to play against a friend."
    puts "Enter 1 to play against a computer."
    puts "Enter 2 to start a computer vs computer game."
    puts "Enter 3 to start a computer vs computer a 100 game 'wargame'."
    start
  end

  def start
    game_type = gets.strip.to_i
    
    if game_type == 0
      game_type_0
    elsif game_type == 1
      game_type_1
    elsif game_type == 2
      game_type_2
     elsif game_type == 3
      game_type_3
    else
      puts "Invalid game mode. Please try again."
    end
    play_again?
  end

  private

  attr_accessor :token_type

  def token_selection
    puts "Do you want to be 'X' or 'O'?"
    token_type = gets.strip.upcase
    if token_type == "X" || token_type == "O" 
      token_type
    else
      puts "I'm not sure what you meant. Please try again."
      token_selection
    end
  end
    
  def game_type_0
    puts "You have chosen to play TicTacToe against a friend."
    puts "Which one ('X' or 'O') should start?"
    token_selection

    if token_type == "X"
      Game.new.play
    elsif token_type == "O"
      Game.new(Players::Human.new("O"), Players::Human.new("X")).play
    end
  end

  def game_type_1
    puts "You have chosen to play TicTacToe against a computer."
    puts "Which one should start?"
    puts "Enter 'h' for a human to start or 'c' for a computer to start."
    player = gets.strip.downcase
    
    if player == 'h'
      token_selection
      if token_type == "X"
        Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
      elsif token_type == "O"
        Game.new(Players::Human.new("O"), Players::Computer.new("X")).play
      end
    elsif player == 'c'
      token_selection
      if token_type == "X"
        Game.new(Players::Computer.new("O"), Players::Human.new("X")).play
      elsif token_type == "O"
        Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
      end
    else
      puts "I'm not sure what you meant. Please try again."
      game_type_1
    end
  end

  def game_type_2
    Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
  end

  def game_type_3
    Game.new(Players::Computer.new("X"), Players::Computer.new("O")).wargame
  end

  def play_again?
    puts "Would you like to play again?"
    puts "Enter 'y' for yes and 'n' for no."
    again = gets.strip.downcase
    if again == 'y'
      new_game
    elsif again == 'n'
      puts "Thank you for playing TicTacToe! Goodbye now."
    else
      puts "I didn't quite get that."
      play_again
    end
  end


end