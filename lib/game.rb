def start
    input = gets.strip.to_i

      if input == 1
        puts "You have chosen Option 1: 2 Computer players."
        puts "Let the game begin!!"
        Board.new.display
        game = Game.new(player_1= Players::Computer.new("X"), player_2= Players::Computer.new("O"))
        game.play
      elsif input == 2
        puts "You have chosen Option 2: 1 player."
        puts "Who would you like to go first - you or the computer? For yourself, type 1. For computer, type 2."
        turn = gets.strip.to_i
        puts "Would you like to be X or O?"
        token = gets.strip.downcase
        puts "Let the game begin!!"
        Board.new.display
          if turn == 1 && token == "x"
            game = Game.new(player_1= Players::Human.new("X"), player_2= Players::Computer.new("O"))
            game.play
          elsif turn == 1 && token == "o"
            game = Game.new(player_1= Players::Human.new("O"), player_2= Players::Computer.new("X"))
            game.play
          elsif turn == 2 && token == "x"
            game = Game.new(player_1= Players::Computer.new("O"), player_2= Players::Human.new("X"))
            game.play
          elsif turn == 2 && token == "o"
            game = Game.new(player_1= Players::Computer.new("X"), player_2= Players::Human.new("O"))
            game.play
          end
      elsif input == 3
        puts "You have chosen Option 3: 2 Human players."
        puts "Would you like to be Player 1 or 2? For Player 1, type 1. For Player 2, type 2."
        turn = gets.strip.to_i
        puts "Would you like to be X or O?"
        token = gets.strip.downcase
        puts "Let the game begin!!"
        Board.new.display
          if turn == 1&& token == "x"
            # binding.pry
            game = Game.new(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"))
            game.play
          elsif turn == 1 && token == "o"
            game = Game.new(player_1= Players::Human.new("O"), player_2= Players::Human.new("X"))
            game.play
          elsif turn == 2 && token == "x"
            game = Game.new(player_1= Players::Human.new("O"), player_2= Players::Human.new("X"))
            game.play
          elsif turn == 2 && token == "o"
            game = Game.new(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"))
            game.play
          end
        end
          #//////////////START ANOTHER GAME//////////////////
          puts "Would you like to play another game?"
          puts "Type Y for YES, N for NO"
          replay = gets.strip.downcase
          if replay == "y"
            Game.new.start
          elsif replay == "n"
            puts "Good-bye. See you soon!"
          end
    end
