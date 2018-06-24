class TicTacToeCLI

  def call
    puts "Welcome to Tic Tac Toe!"
    puts "How many players are playing today? Please type 0, 1, or 2."
    input = gets.strip.to_i
      # use until to loop until something negative happens
      until input.between?(1,3)
        puts "Oops! Our system did not recognize this magic. The given options are the following: 0 (players), 1 (player), or 2 (players)."
        # ask for input again
        input = gets.strip.to_i
      end

      # AI VS AI

      if input == 0
        puts "Computer vs. Computer. Let the games begin!"
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
        game.play

      # HUMAN VS AI

      elsif input == 1
        puts "You vs. Computer. This should be challenging!"

        def who_first
          puts "If you would like to go first, type 1. If you want to be second, type 2."
          turn = gets.strip.to_i
            until turn.between?(1,2)
              puts "Oops! Our system did not recognize this magic. The given options are the following: 1 (for you), or 2 (for computer)."
                turn = gets.strip.to_i
            end
        end

        def play_as_x_or_o
          puts "Would you like to play as X or O?"
          token = gets.strip
            until token != "X" || "O"
              puts "Oops! Our system did not recognize this magic. The given options are the following: X or O."
              token = gets.strip
            end
        end

          puts "GOOD LUCK!"

          if turn == 1 && token == "X"
            game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
            game.board.display
            game.play
          elsif turn == 1 && token == "O"
            game = Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Computer.new("X"))
            game.board.display
            game.play
          elsif turn == 2 && token == "X"
            game = Game.new(player_1 = Players::Computer.new("O"), player_2 = Players::Human.new("X"))
            # don't display board
            game.play
          elsif turn == 2 && token == "O"
            game = Game.new(player_1 == Players::Computer.new("X"), player_2 = Players::Human.new("O"))
            game.play
          end

      # HUMAN VS HUMAN

      elsif input == 2
        puts "You vs. Opponent. Make it count!"

        who_first
        play_as_x_or_o

        puts "Let the better one win!"

        if turn == 1 && token == "X"
          game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
          game.board.display
          game.play
        elsif turn == 1 && token == "O"
          game = Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Human.new("X"))
          game.board.display
          game.play
        elsif turn == 2 && token == "X"
          game = Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Human.new("X"))
          game.board.display
          game.play
        elsif turn == 2 && token == "O"
          game = Game.new(player_1 == Players::Human.new("X"), player_2 = Players::Human.new("O"))
          game.board.display
          game.play
        end
      end

      puts "Wanna play more?"
      puts "Y: Yes, N: NO."
      rematch(input)
  end

  def rematch(input)
    input = gets.strip
    if input == "Y" || "y"
      game
    elsif input == "N" || "n"
      puts "Good games! Bye."
    end
  end
end
