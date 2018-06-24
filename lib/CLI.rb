class Cli

  def call
    game
  end

  def game
    puts "Hi there! Welcome to the awesome world of Tic-Tac-Toe"
    puts "What kind of game would you like to play?"
    sleep(0.5)
    puts "Option 1:  Computer v. Computer"
    puts "For Option 1, type 1"
    puts "-----------OR---------"
    puts "Option 2: You v. Computer"
    puts "For Option 2, type 2"
    puts "-----------OR---------"
    puts "Option 3: You v. a friend"
    puts "For Option 3, type 3."
    input = gets.strip.to_i
      until input.between?(1,3)
        puts "Invalid entry. Try entering the given option numbers - 1, 2 or 3."
        input = gets.strip.to_i
      end
      if  input == 1
          puts "You have chosen Option 1: Computer v. Computer."
          sleep(0.5)
          puts "Let the game begin!!"
          print "1               "
          sleep(0.5)
          print "2               "
          sleep(0.5)
          puts "3               "
          game = Game.new(player_1= Players::Computer.new("X"), player_2= Players::Computer.new("O"))
          game.play
      elsif input == 2
        puts "You have chosen Option 2: You v. Computer."
        puts "Who would you like to go first - you or the computer? For yourself, type 1. For computer, type 2."
        turn = gets.strip.to_i
            until turn.between?(1,2)
              puts "Invalid entry. Please check your entry and enter either 1 or 2."
              turn = gets.strip.to_i
            end
        puts "Would you like to be X or O?"
        token = gets.strip.downcase
          until token == "x" || token == "o"
              puts "Invalid entry. Please check your entry and enter either X or O."
              token = gets.strip.downcase
            end
          puts "Let the game begin!!"
          print "1               "
          sleep(0.5)
          print "2               "
          sleep(0.5)
          puts "3               "
            if turn == 1 && token == "x"
              game = Game.new(player_1= Players::Human.new("X"), player_2= Players::Computer.new("O"))
              game.board.display
              puts "Go!"
              game.play
            elsif turn == 1 && token == "o"
              game = Game.new(player_1= Players::Human.new("O"), player_2= Players::Computer.new("X"))
              game.board.display
              puts "Go!"
              game.play
            elsif turn == 2 && token == "x"
              game = Game.new(player_1= Players::Computer.new("O"), player_2= Players::Human.new("X"))
              game.play
            elsif turn == 2 && token == "o"
              game = Game.new(player_1= Players::Computer.new("X"), player_2= Players::Human.new("O"))
              game.play
            end
      elsif input == 3
        puts "You have chosen Option 3: You v. a friend."
        puts "Would you like to be Player 1 or 2? For Player 1, type 1. For Player 2, type 2."
        turn = gets.strip.to_i
          until turn.between?(1,2)
            puts "Invalid entry. Please check your entry and enter either 1 or 2."
            turn = gets.strip.to_i
          end
        puts "Would you like to be X or O?"
        token = gets.strip.downcase
        until token == "x" || token == "o"
            puts "Invalid entry. Please check your entry and enter either X or O."
            token = gets.strip.downcase
          end
        puts "Let the game begin!!"
        print "1               "
        sleep(0.5)
        print "2               "
        sleep(0.5)
        puts "3               "
              if turn == 1 && token == "x"
                game = Game.new(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"))
                game.board.display
                puts "Go!"
                game.play
              elsif turn == 1 && token == "o"
                game = Game.new(player_1= Players::Human.new("O"), player_2= Players::Human.new("X"))
                game.board.display
                puts "Go!"
                game.play
              elsif turn == 2 && token == "x"
                game = Game.new(player_1= Players::Human.new("O"), player_2= Players::Human.new("X"))
                game.board.display
                puts "Go!"
                game.play
              elsif turn == 2 && token == "o"
                game = Game.new(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"))
                game.board.display
                puts "Go!"
                game.play
              end
          end
        sleep (0.5)
        puts "Would you like to play another game?"
        puts "Type Y for YES, N for NO"
      replay(input)
  end

  def replay(input)
    input = gets.strip.downcase
      until input == "y"|| input =="n"
        puts "Invalid entry. Please check your entry and enter either Y or N."
        input = gets.strip.downcase
      end
      if input == "y"
        game
      elsif input == "n"
        puts "Good-bye. See you soon!"
      end
  end
end
