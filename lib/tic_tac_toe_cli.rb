class TicTacToeCLI
  def initialize
  end

  def board
    puts "   |   |   "
    puts "-----------"
    puts "   |   |   "
    puts "-----------"
    puts "   |   |   "
  end

  def call
    puts "******************************************"
    puts "Greetings! Welcome to Tic Tac Toe with AI!"
    puts "******************************************\n"
    puts "What type of game do you want to play?"
    list_options
  end

  def list_options
    puts "\n
    1. Computer vs. Computer
    2. Play against the Computer
    3. Two Player\n
    enter 'quit' to return to the menu,
    or 'exit' to leave the program\n"
    input = gets.strip
    user_options(input)
  end

  def user_options(input)
    if input == '1'
        computer_vs_computer
      elsif input == '2'
        human_vs_computer
      elsif input == '3'
        human_vs_human
      elsif input.downcase == 'quit'
        call
      elsif input.downcase == 'exit'
        puts "Thank you for playing TicTacToe! Goodbye\n"
        exit
      else
        puts "Invalid entry! Please choose one of the options \n"
        list_options
    end
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    input = gets.strip
    if input.downcase == 'y'
      puts "\n"
      puts "Please pick an option:"
      list_options
    else
      puts "Thank you for playing TicTacToe! Goodbye\n"
      exit
    end
  end

  def computer_vs_computer
    puts "Computer vs Computer: The ultimate showdown.\n"
    board
    Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), Board.new).play
    play_again?
  end

  def human_vs_computer
    puts "Would you like to be player 1 or player 2?"
    puts "1 to be first player"
    puts "2 to be second player"
    input = gets.strip
      if input == '1'
        puts "You will go first, and be X"
        puts "The computer will go second, and be O"
        board
        Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), Board.new).play
      elsif input == '2'
        puts "The computer will go first, and be X"
        puts "You will go second, and be O"
        board
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), Board.new).play
      end
      play_again?
  end

  def human_vs_human
    puts "Player 1 will be X"
    puts "Player 2 will be O\n"
    board
    Game.new(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), Board.new).play
    play_again?
  end
end
