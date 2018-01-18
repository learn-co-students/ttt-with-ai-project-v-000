class TicTacToeCLI

  def initialize
  end

  def call
    puts "Welcome to TicTacToe! How many players? Enter 0, 1, or 2."
    input = nil

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
        puts "Thanks for playing TicTacToe, see you next time!"
        exit
      else
        puts "I didn't quite get that."
        call
    end

    def game_loop
      puts "Would you like to play again? (y/n)"
      input = gets.strip
      if input.downcase == "yes" || input.downcase == "y"
        call
      elsif input.downcase == "n" || input.downcase == "no" || input.downcase == "exit"
        puts "Thanks for playing TicTacToe, see you next time!"
        exit
      else
        puts "I didn't quite get that."
        game_loop
      end
    end

    tictactoe = Game.new(player_1, player_2)
    tictactoe.play
    game_loop

  end
end
