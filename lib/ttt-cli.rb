class TicTacToeCLI
  def call
    input = "go"

    until input == "q" do
      puts "Hi there! would you like to play with 0, 1 or 2 player? type 0, 1 or 2 to begin."
      input = gets.chomp.upcase

      if input == "0" or input == ""
        player_1 = Players::Computer.new("X")
        player_2 = Players::Computer.new("O")
      elsif input == "1"
        puts "Would you like to be first (and 'X') ? y for 'yes'"
        players = gets.chomp.upcase
        if players == "Y"
          player_1 = Players::Human.new("X")
          player_2 = Players::Computer.new("O")
        else
          player_2 = Players::Human.new("O")
          player_1 = Players::Computer.new("X")
        end
      elsif input == "2"
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
      elsif input == 'Q'
        return
      elsif input == 'WARGAMES'
        player_1 = Players::Computer.new("X")
        player_2 = Players::Computer.new("O")
        comp1 = 0
        comp2 = 0
        ties = 0
        100.times do
          game = Game.new(player_1, player_2, Board.new)
          game.play
          comp1 += 1 if game.winner == "X"
          comp2 += 1 if game.winner == "O"
          ties += 1 if game.winner == nil
        end
        puts "\n======================="
        puts "\nTotal games played: 100"
        puts "\nPlayer 1 (X) won: #{comp1} times"
        puts "Player 2 (O) won: #{comp2} times"
        puts "Game was tied:    #{ties} times"
        gets
        next
      else
        next
      end

      game = Game.new(player_1, player_2, Board.new)
      game.play
    end

  end
end
