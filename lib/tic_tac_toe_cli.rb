class TicTacToeCLI
  def initialize
    puts "Welcome to TicTacToe!"
  end
  def call
    puts "Please choose from one of the following game options:"
    puts "A. 0-player game"
    puts "B. 1-player game"
    puts "C. 2-player game"
    game_option = gets.chomp.upcase
    case game_option
    when "A"
      game = Game.new(Players::Computer.new("X"),Players::Computer.new("O"),Board.new)
      game.play
    when "B"
      first_player = ""
      until first_player == "A" || first_player == "B"
        puts "Please choose who should be first and play as X:"
        puts "A. Me"
        puts "B. Computer"
        first_player = gets.chomp.upcase
      end
      case first_player
      when "A"
        puts "Great! You will be the first player, playing as X."
        game = Game.new(Players::Human.new("X"),Players::Computer.new("O"),Board.new)
        game.play
      when "B"
        puts "Great! You will be the second player, playing as O."
        game = Game.new(Players::Computer.new("X"),Players::Human.new("O"),Board.new)
        game.play
      end
    when "C"
      puts "First player will play as X, and second player will play as O."
      puts "Player X first move:"
      game = Game.new(Players::Human.new("X"),Players::Human.new("O"),Board.new)
      game.play
    when "exit" || "Exit" || "EXIT"
      exit
    else
      call
    end
    input = ""
    until input == "Y" || input == "N"
      puts "Would you like to play again?"
      puts "Y: Yes"
      puts "N: No"
      input = gets.chomp.upcase
    end
    call if input == "Y"
  end
end
