class CLI

  def call
      puts "Would you like to play with 0, 1, or 2 players?"
        number_of_players = gets.strip.to_i
      #puts "Which player should go first and be 'X'?"
        #player_1 = gets.strip
      if number_of_players == 1
        puts "Should player 1 be a computer or a human?"
        answer = gets.strip.downcase
      end

      if number_of_players == 0
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), Board.new)
      elsif number_of_players == 1
        if answer == "computer"
          game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), Board.new)
        elsif answer == "human"
          game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), Board.new)
        end
      else
        game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), Board.new)
      end

      game.play
    end

end
