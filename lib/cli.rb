class CLI

  def call
    puts "Welcome to TicTacToe"
    begin

      begin
        puts "0, 1 or 2 player(s)?"
        players = gets.strip
      end until players.to_i.between?(0,2)

      if players == "1"
        game = humanVsComputer

      elsif players == "2"
        game = humanVshuman

      elsif players == "0"
        game = computerVscomputer
      end

      game.board.display
      game.play
      begin
        puts "Play again? Y/N"
        input = gets.strip.upcase
      end until input == "Y" || input == "N"

    end until input == "N"
    puts "good bye"
  end

  def humanVsComputer
    game = Game.new
    begin
      puts "first player X? Y/N"
      input = gets.strip.upcase
    end until input == "Y" || input == "N"

    if input == "Y"
      game.player_1 = Players::Human.new("X")
      game.player_2 = Players::Computer.new("O", game)

    else
      game.player_1 = Players::Human.new("O")
      game.player_2 = Players::Computer.new("X", game)
    end
    game
  end

  def humanVshuman
    begin
      puts "first player X? Y/N"
      input = gets.strip.upcase
    end until input == "Y" || input == "N"

    if input == "Y"
      game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
    else
      game = Game.new(Players::Human.new("O"), Players::Human.new("X"), Board.new)
    end
  end

  def computerVscomputer
    #game = Game.new(Players::Computer.new("X", game), Players::Computer.new("O", game), Board.new)
    game = Game.new
    game.player_1 = Players::Computer.new("X", game)
    game.player_2 = Players::Computer.new("O", game)
    game
  end

end
