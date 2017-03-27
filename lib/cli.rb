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
    begin
      puts "first player X? Y/N"
      input = gets.strip.upcase
    end until input == "Y" || input == "N"

    if input == "Y"
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
    else
      game = Game.new(Players::Human.new("O"), Players::Computer.new("X"), Board.new)
    end

  end

  def humanVshuman
    begin
      puts "first player X? Y/N"
      input = gets.strip
    end until input == "Y" || input == "N"

    if input == "Y"
      game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
    else
      game = Game.new(Players::Human.new("O"), Players::Human.new("X"), Board.new)
    end
  end

  def computerVscomputer
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
  end

end
