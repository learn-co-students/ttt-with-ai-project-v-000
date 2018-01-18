class TicTacToeCLI

  def initialize
  end

  def game_loop
    puts "Would you like to play again?"
    input = gets.strip
  end

  def call
    puts "Welcome to TicTacToe! How many players?"
    input = nil

    until input == "exit"
      input = gets.strip
      case input
        when "0"
          player_1 = Players::Computer.new("X")
          player_2 = Players::Computer.new("O")
        when "1"
          player_1 = Players::Human.new("X")
          player_2 = Players::Computer.new("O")
        when "2"
          player_1 = Players::Human.new("X")
          player_2 = Players::Human.new("O")
        when "exit"
          exit
      end

      tictactoe = Game.new(player_1, player_2)
      tictactoe.play
      game_loop

      if input == "yes" || input == "y"
        tictactoe = Game.new(player_1, player_2)
        tictactoe.play
        game_loop
      elsif input == "no" || input == "exit"
        exit
      end

    end
  end
end
