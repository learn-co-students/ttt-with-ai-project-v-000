class TicTacToe_CLI

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "What type of game would you like to play?"
    puts "Type '0' for computer vs. computer."
    puts "Type '1' for player vs. computer."
    puts "Type '2' for player vs. player."
    puts "Type 'wargames' to have the computer play against itself 100 times."
    puts "Type 'exit' to exit the program."
    input = gets.chomp

    case input
    
    when "0"
      game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Computer.new("O"), board = Board.new)
      game.play
    
    when "1"
      puts "Would you like play as X, or O? (X goes first). Please enter 'x' or 'o'."
      input = gets.chomp
      case input
        when "x"
          puts "Player 1 is X. The computer is O."
          game = Game.new(player_1 = Player::Human.new("X"), player_2 = Player::Computer.new("O"), board = Board.new)
          game.play
        when "o"
          puts "Player 1 is O. The computer is X."
          game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
          game.play
        else
          puts "Please enter a valid command."
      end
    
    when "2"
      puts "Player 1 is X. Player 2 is O."
      game = Game.new
      game.play
    
    when "wargames"
      x_wins = 0
      o_wins = 0
      draw_count = 0
      100.times do
        game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Computer.new("O"), board = Board.new)
        game.play
        if game.winner == "X"
          x_wins += 1
        elsif game.winner == "O"
          o_wins += 1
        elsif game.draw?
          draw_count += 1
        end
      end
      puts "Results:"
      puts "X wins: #{x_wins}."
      puts "O wins: #{o_wins}."
      puts "Draws: #{draw_count}."
    
    when "exit"
      puts "Goodbye!"
    else
      puts "Please enter a valid command."
      start
    end
    
    play_again unless input == "exit"
  end

  def play_again
    puts "Would you like to play again?"
    puts "Type 'y' or 'n.'"
    input = gets.chomp

    case input
    when "y"
      start
    when "n"
      puts "Goodbye!"
    else
      puts "Please type 'y' or 'n.'"
      play_again
    end
  end

end
