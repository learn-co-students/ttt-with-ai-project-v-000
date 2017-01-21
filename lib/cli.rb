class CLI

    def self.start
      puts "Welcome to Tic-Tac-Toe with AI!"
      puts "Do you want to play a game with 0, 1, or 2 players? You can also select 'wargames'."
      type = gets.strip

      case type

        when "0"
          game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        when "1"
          puts "You selected a one player game. If you would like to be 'X' and go first, type 'X'. If you would like to be 'O' and go second, type 'O'."
          human = gets.upcase.strip
          if human == "X"
            game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
          elsif human == "O"
            game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
          else
            puts "Start over. You have to pick a valid player."
            self.start
          end
        when "2"
          puts "You selected a two person game. 'X' goes first."
          game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        when "wargames"
          self.wargames
        else
          puts "Select a valid game type."
          self.start
      end
      game.play
      puts "Would you like to play again? (Y, N)"
      input = gets.upcase.strip
      if input == "Y"
        self.start
      else
        exit!
      end
    end

    def self.wargames
      counter = 0
      wins = 0
      while counter < 100
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        game.play
        if game.won?
          wins += 1
        end
        counter += 1
      end
      puts "There was a winner in #{wins} of 100 games"
      puts "Would you like to play again? (Y, N)"
      input = gets.upcase.strip
      if input == "Y"
        self.start
      else
        exit!
      end
    end

end
